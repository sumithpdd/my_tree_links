import 'package:my_tree_links/models/app_user.dart';

List<Map<String, dynamic>> socialLinks = [
  {
    'linkType': 'twitter',
    'url': 'https://twitter.com/sumithpdd',
    'text': 'Twitter',
  },
  {
    'linkType': 'linkedin',
    'url': 'https://linkedin.com/sumithpdd',
    'text': 'LinkedIn',
  },
  {
    'linkType': 'github',
    'url': 'https://github.com/sumithpdd',
    'text': 'Github',
  },
  {
    'linkType': 'website',
    'url': 'https://sumithpd.com',
    'text': 'Website',
  },
  {
    'linkType': 'other',
    'url': 'https://novowallet.app',
    'text': 'Novowallet',
  },
  {
    'linkType': 'other',
    'url':
        'https://cloud.google.com/blog/topics/training-certifications/12-days-of-no-cost-generative-ai-training',
    'text': 'Google GenAI training',
  }
];
AppUser dummyUser = AppUser(
    id: "0",
    name: "Sumith Damodaran",
    bio: "I build products!",
    email: "sumithpd@gmail.com",
    profileImageUrl:
        'https://media.licdn.com/dms/image/C4E03AQGOKh8OLSA2ag/profile-displayphoto-shrink_800_800/0/1517675531844?e=1706745600&v=beta&t=1Ozk3781_s6Z_qF7V85ZRsNSd6e3Z90Durnb1bznPQY',
    links: socialLinks);
