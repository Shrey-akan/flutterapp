import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobmobapp/src/login/login.dart';

class JobListPage extends StatefulWidget {
  const JobListPage({Key? key}) : super(key: key);

  @override
  _JobListPageState createState() => _JobListPageState();
}

class _JobListPageState extends State<JobListPage> {
  late Future<List<JobPost>> _jobPosts;
  late List<JobPost> _allJobPosts;
  late List<JobPost> _filteredJobPosts;
  final List<String> _searchHistory = [];
  final List<String> _suggestions = ['Java', 'Flutter', 'SEO']; // Initial suggestions
  final List<String> _selectedJobTitles = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _jobPosts = fetchJobPosts();
    _allJobPosts = [];
    _filteredJobPosts = [];
  }

  Future<List<JobPost>> fetchJobPosts() async {
    try {
      final response =
          await http.get(Uri.parse('https://job4jobless.com:9001/fetchjobpost'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((job) => JobPost.fromJson(job)).toList();
      } else {
        print(
            'Failed to load job posts. Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        return [];
      }
    } catch (error) {
      print('Error fetching job posts: $error');
      return [];
    }
  }

  Future<void> _performSearch() async {
    final lowerCaseQueries =
        _selectedJobTitles.map((title) => title.toLowerCase()).toList();

    setState(() {
      if (lowerCaseQueries.isNotEmpty) {
        _filteredJobPosts = _allJobPosts
            .where((post) =>
                lowerCaseQueries.every((query) =>
                    post.title.toLowerCase().contains(query)))
            .toList();
      } else {
        _filteredJobPosts = _allJobPosts;
      }
    });
  }

  void _handleApply(JobPost job) {
    bool isLoggedIn = false; // Replace with your actual login check logic

    if (isLoggedIn) {
      // Perform apply logic
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  void _addToSearchHistory(String query) {
    if (!_searchHistory.contains(query)) {
      setState(() {
        _searchHistory.add(query);
      });
    }
  }

  List<String> _getSuggestions(String query) {
    final lowerCaseQuery = query.toLowerCase();
    return _suggestions
        .where((suggestion) =>
            suggestion.toLowerCase().contains(lowerCaseQuery))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Listings'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onChanged: (query) {
                          _performSearch();
                          setState(() {
                            _suggestions.clear();
                            _suggestions.addAll(_getSuggestions(query));
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Search by Job Title',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        _performSearch();
                        _addToSearchHistory(_searchController.text);
                      },
                    ),
                  ],
                ),
                if (_suggestions.isNotEmpty)
                  Wrap(
                    spacing: 8.0,
                    children: _suggestions.map((String suggestion) {
                      return FilterChip(
                        label: Text(suggestion),
                        selected: _selectedJobTitles.contains(suggestion),
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              _selectedJobTitles.add(suggestion);
                            } else {
                              _selectedJobTitles.remove(suggestion);
                            }
                            _performSearch();
                          });
                        },
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: FutureBuilder<List<JobPost>>(
                future: _jobPosts,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    _allJobPosts = snapshot.data ?? [];
                    List<JobPost> jobPosts =
                        _filteredJobPosts.isNotEmpty ? _filteredJobPosts : _allJobPosts;

                    if (_selectedJobTitles.isNotEmpty && jobPosts.isEmpty) {
                      return _buildNoMatchingPostsMessage('No matching job posts available for the selected titles.');
                    } else if (_searchController.text.isNotEmpty && jobPosts.isEmpty) {
                      return _buildNoMatchingPostsMessage('No job posts found for the search criteria.');
                    } else if (jobPosts.isEmpty) {
                      return _buildNoMatchingPostsMessage('No job posts available.');
                    } else {
                      return Column(
                        children: jobPosts.map((job) {
                          return JobCard(
                            job: job,
                            onApply: () => _handleApply(job),
                          );
                        }).toList(),
                      );
                    }
                  }
                },
              ),
            ),
          ),
          if (_searchHistory.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Search History:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: _searchHistory.map((String query) {
                      return ActionChip(
                        label: Text(query),
                        onPressed: () {
                          _searchController.text = query;
                          _performSearch();
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNoMatchingPostsMessage(String message) {
    return Center(
      child: Text(message),
    );
  }
}

class JobCard extends StatelessWidget {
  final JobPost job;
  final VoidCallback onApply;

  const JobCard({required this.job, required this.onApply, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(job.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Company: ${job.company}'),
            Text('Location: ${job.location}'),
            Text('Job Type: ${job.jobType}'),
          ],
        ),
        onTap: onApply,
        trailing: ElevatedButton(
          onPressed: onApply,
          child: const Text('Apply'),
        ),
      ),
    );
  }
}

class JobPost {
  final String title;
  final String company;
  final String location;
  final String jobType;

  JobPost({
    required this.title,
    required this.company,
    required this.location,
    required this.jobType,
  });

  factory JobPost.fromJson(Map<String, dynamic> json) {
    return JobPost(
      title: json['jobtitle'] ?? '',
      company: json['companyforthisjob'] ?? '',
      location: json['locationjob'] ?? '',
      jobType: json['jobtype'] ?? '',
    );
  }
}
