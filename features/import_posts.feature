Feature: Import posts
  As a Ghost user that have a lot of posts written in the ghost plataform.
  In order to try Jekyll.
  I want to import the posts that I already written.

  Scenario: Import a simple backup file
    Given a file named "GhostBackup.json" with:
    """
    {
        "data": {
            "posts": [
                {
                    "slug": "welcome-to-ghost",
                    "markdown": "You're live!",
                    "published_at": "2014-02-21T01:14:57.000Z"
                }
            ]
        }
    }
    """
    When I run `jekyll_ghost_importer GhostBackup.json`
    Then a directory named "_posts" should exist
    Then the file "_posts/2014-02-21-welcome-to-ghost.markdown" should contain:
    """
    You're live!
    """

  Scenario: Import a backup file with two posts.
    Given a file named "GhostBackup.json" with:
    """
    {
        "data": {
            "posts": [
                {
                    "id": 1,
                    "uuid": "1425c966-bff2-4e32-98f6-222b4a7059e5",
                    "title": "Welcome to Ghost",
                    "slug": "welcome-to-ghost",
                    "markdown": "You're live!",
                    "image": null,
                    "featured": 0,
                    "page": 0,
                    "status": "published",
                    "language": "en_US",
                    "meta_title": null,
                    "meta_description": null,
                    "author_id": 1,
                    "created_at": "2014-02-21T01:14:57.000Z",
                    "created_by": 1,
                    "updated_at": "2014-02-21T01:14:57.000Z",
                    "updated_by": 1,
                    "published_at": "2014-02-21T01:14:57.000Z",
                    "published_by": 1
                },
                {
                    "id": 2,
                    "uuid": "1d901d55-c286-427a-8b9b-16a7f37a8a8e",
                    "title": "Tengo otro blog",
                    "slug": "tengo-otro-blog",
                    "markdown": "Y con este ya son tres.",
                    "image": null,
                    "featured": 0,
                    "page": 0,
                    "status": "published",
                    "language": "en_US",
                    "meta_title": null,
                    "meta_description": null,
                    "author_id": 1,
                    "created_at": "2014-02-21T02:31:55.000Z",
                    "created_by": 1,
                    "updated_at": "2014-02-21T02:31:55.000Z",
                    "updated_by": 1,
                    "published_at": "2014-02-21T02:31:55.000Z",
                    "published_by": 1
                }
            ],
            "users": [
                {
                    "id": 1,
                    "uuid": "992a86cc-bca7-400e-affe-9df3fb17d27e",
                    "name": "eloyesp",
                    "slug": "eloy",
                    "password": "$2a$10$6saUGJvuZXHR3SAY5tSevumPoHmrmHzB9QRM3Zx.eugBcFqvlscva",
                    "email": "eloyesp@gmail.com",
                    "image": "//www.gravatar.com/avatar/224f5b1b5ee448ec8152236ede91908c?d=404",
                    "cover": null,
                    "bio": "",
                    "website": "eloyesp@gmail.com",
                    "location": "",
                    "accessibility": null,
                    "status": "active",
                    "language": "en_US",
                    "meta_title": null,
                    "meta_description": null,
                    "last_login": null,
                    "created_at": "2014-02-21T01:15:40.000Z",
                    "created_by": 1,
                    "updated_at": "2014-05-25T02:00:35.000Z",
                    "updated_by": 1
                }
            ],
            "tags": [
                {
                    "id": 1,
                    "uuid": "16f75a15-420a-444d-9aad-8edd05f68587",
                    "name": "Getting Started",
                    "slug": "getting-started",
                    "description": null,
                    "parent_id": null,
                    "meta_title": null,
                    "meta_description": null,
                    "created_at": "2014-02-21T01:14:57.000Z",
                    "created_by": 1,
                    "updated_at": "2014-02-21T01:14:57.000Z",
                    "updated_by": 1
                }
            ],
            "posts_tags": [
                {
                    "id": 1,
                    "post_id": 1,
                    "tag_id": 1
                }
            ]
        }
    }
    """
    When I run `jekyll_ghost_importer GhostBackup.json`
    Then a directory named "_posts" should exist
    Then the file "_posts/2014-02-21-welcome-to-ghost.markdown" should contain:
    """
    You're live!
    """
    Then the file "_posts/2014-02-21-tengo-otro-blog.markdown" should contain:
    """
    Y con este ya son tres.
    """

  Scenario: Import a backup file with drafts
    Given a file named "GhostBackup.json" with:
    """
    {
        "data": {
            "posts": [
                {
                    "id": 5,
                    "title": "Something Software",
                    "slug": "something-software",
                    "markdown": "Something here",
                    "image": null,
                    "featured": 0,
                    "page": 0,
                    "status": "draft",
                    "language": "en_US",
                    "meta_title": null,
                    "meta_description": null,
                    "author_id": 1,
                    "created_at": "2014-03-04T23:22:48.000Z",
                    "created_by": 1,
                    "updated_at": "2014-03-11T23:50:56.000Z",
                    "updated_by": 1,
                    "published_at": null,
                    "published_by": null
                }
            ]
        }
    }
    """
    When I run `jekyll_ghost_importer GhostBackup.json`
    Then a directory named "_drafts" should exist
    Then the file "_drafts/something-software.markdown" should contain:
    """
    Something here
    """
