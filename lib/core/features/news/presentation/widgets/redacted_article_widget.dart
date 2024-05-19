import 'package:flutter/material.dart';


class RedactedArticleWidget extends StatelessWidget {
  const RedactedArticleWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6,horizontal: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey,
            ),
            
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                const SizedBox(height: 10),
                 Container(
                  height: 10,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                const SizedBox(height: 10),
                 Container(
                  height: 10,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                Container(
                  height: 5,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
