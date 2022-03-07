# README

* Ruby version
Ruby 3.0.0
* System dependencies
Install postgresql, pgadmin and ubuntu.
* Database creation
On bash run command "rails db:create"
* Database initialization
On bash run command "rails db:migrate.
* How it can be manually tested?
It can be tested manually by different names of ingredients. It searches from the whole database and
display available recipes that can be prepare with the name of ingredients. 
Gems
This application uses multiple gems to make the searches of system faster and display closest 
recipes from available ingredients. Here is the list of gems that are used in this application. 
1) pg_search
2) pagy
1). pg_search is use for advance search technique and it is used for filtering results. This app use 
search_scope to search within a single model, but with greater flexibility. To make search faster, i 
add column of "searchable" in ingredients table and store and ranked data from best match to worst.
By ranking, it handles not only searching, but also putting the results in the correct order so the 
closest recipe come out from search. It use vectors to search data faster and also do indexing to 
quickly locate data from database.
3). This gem is used for pagination to display data on different pages.
4). Active Record Import is used to store data in database in bulk processes. There are multiple 
records in JSON file and on parsing multiple queries are running on creation of data. But with the 
help of this gem, only 1 query run and save data in database in bulk format.
Deployment instructions
Deployed on Heroku. https://pennylane-recipe.herokuapp.com


SQL
SELECT COUNT(*) FROM "recipes" INNER JOIN (SELECT "recipes"."id" AS pg_search_id, (ts_rank((to_tsvector('english', coalesce("recipes"."title"::text, '')) || to_tsvector('english', coalesce(pg_search_7ca4e377ff4ca15213f780.pg_search_f88524159d982731f7e7ef::text, ''))), (''), 0)) AS rank FROM "recipes" LEFT OUTER JOIN (SELECT "recipes"."id" AS id, string_agg("ingredients"."name"::text, ' ') AS pg_search_f88524159d982731f7e7ef FROM "recipes" INNER JOIN "ingredients" ON "ingredients"."recipe_id" = "recipes"."id" GROUP BY "recipes"."id") pg_search_7ca4e377ff4ca15213f780 ON pg_search_7ca4e377ff4ca15213f780.id = "recipes"."id" WHERE ((to_tsvector('english', coalesce("recipes"."title"::text, '')) || to_tsvector('english', coalesce(pg_search_7ca4e377ff4ca15213f780.pg_search_f88524159d982731f7e7ef::text, ''))) @@ (''))) AS pg_search_63b8bd59a482879ad0634d ON "recipes"."id" = pg_search_63b8bd59a482879ad0634d.pg_search_id




* Brakeman 

== Brakeman Report ==

Application Path: /home/devbox/rails/pennylane
Rails Version: 6.1.4.6
Brakeman Version: 5.1.1
Scan Date: 2022-03-08 01:56:17 +0500
Duration: 0.710998409 seconds
Checks Run: BasicAuth, BasicAuthTimingAttack, CSRFTokenForgeryCVE, ContentTag, CookieSerialization, CreateWith, CrossSiteScripting, DefaultRoutes, Deserialize, DetailedExceptions, DigestDoS, DynamicFinders, EscapeFunction, Evaluation, Execute, FileAccess, FileDisclosure, FilterSkipping, ForgerySetting, HeaderDoS, I18nXSS, JRubyXML, JSONEncoding, JSONEntityEscape, JSONParsing, LinkTo, LinkToHref, MailTo, MassAssignment, MimeTypeDoS, ModelAttrAccessible, ModelAttributes, ModelSerialize, NestedAttributes, NestedAttributesBypass, NumberToCurrency, PageCachingCVE, PermitAttributes, QuoteTableName, Redirect, RegexDoS, Render, RenderDoS, RenderInline, ResponseSplitting, RouteDoS, SQL, SQLCVEs, SSLVerify, SafeBufferManipulation, SanitizeMethods, SelectTag, SelectVulnerability, Send, SendFile, SessionManipulation, SessionSettings, SimpleFormat, SingleQuotes, SkipBeforeFilter, SprocketsPathTraversal, StripTags, SymbolDoSCVE, TemplateInjection, TranslateBug, UnsafeReflection, UnsafeReflectionMethods, ValidationRegex, VerbConfusion, WithoutProtection, XMLDoS, YAMLParsing

== Overview ==

Controllers: 2
Models: 3
Templates: 5
Errors: 0
Security Warnings: 0

== Warning Types ==

* Rubocop
Inspecting 16 files
................

16 files inspected, no offenses detected
