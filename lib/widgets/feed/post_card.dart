import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final String name;
  final String role;
  final String content;
  final String postType; // Opportunity / Event / Pitch

  const PostCard({
    super.key,
    required this.name,
    required this.role,
    required this.content,
    required this.postType,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;
  bool showComments = false;
  int likeCount = 12;

  final TextEditingController commentController = TextEditingController();

  final List<String> comments = [
    "This looks promising 👏",
    "Happy to help with scaling strategy.",
  ];

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                child: Icon(Icons.business),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.role,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Chip(
                label: Text(widget.postType),
                backgroundColor: Colors.blue.shade50,
                labelStyle: const TextStyle(fontSize: 12),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// CONTENT
          Text(
            widget.content,
            style: const TextStyle(fontSize: 14),
          ),

          const SizedBox(height: 16),

          /// STATS
          Row(
            children: [
              Text(
                "$likeCount likes",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const Spacer(),
              Text(
                "${comments.length} comments",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),

          const Divider(height: 24),

          /// ACTIONS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _ActionButton(
                icon: isLiked ? Icons.favorite : Icons.favorite_border,
                label: "Like",
                color: isLiked ? Colors.red : Colors.grey,
                onTap: () {
                  setState(() {
                    isLiked = !isLiked;
                    likeCount += isLiked ? 1 : -1;
                  });
                },
              ),
              _ActionButton(
                icon: Icons.comment_outlined,
                label: "Comment",
                onTap: () {
                  setState(() => showComments = !showComments);
                },
              ),
              _ActionButton(
                icon: Icons.share_outlined,
                label: "Share",
                onTap: () {},
              ),
            ],
          ),

          /// COMMENTS SECTION
          if (showComments) ...[
            const Divider(height: 24),

            for (final comment in comments)
              _Comment(
                name: "User",
                comment: comment,
              ),

            /// ADD COMMENT INPUT
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                      hintText: "Write a comment...",
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    final text = commentController.text.trim();
                    if (text.isNotEmpty) {
                      setState(() {
                        comments.add(text);
                        commentController.clear();
                      });
                    }
                  },
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// ACTION BUTTON
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 20, color: color ?? Colors.grey),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(color: color ?? Colors.grey),
          ),
        ],
      ),
    );
  }
}

/// COMMENT UI
class _Comment extends StatelessWidget {
  final String name;
  final String comment;

  const _Comment({
    required this.name,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 14,
            child: Icon(Icons.person, size: 14),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 13),
                  children: [
                    TextSpan(
                      text: "$name\n",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: comment),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
