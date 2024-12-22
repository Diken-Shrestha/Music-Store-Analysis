# SQL Music Database Analysis
This project is a comprehensive exploration of a music store database using SQL. The aim is to extract meaningful insights, answer business questions, and showcase proficiency in data analysis with SQL queries. The database contains information about customers, tracks, artists, albums, invoices, employees, playlists, and genres.

## Project Overview
The music store database serves as the foundation for this analysis, with queries designed to uncover patterns in customer behavior, revenue generation, and music preferences. By leveraging SQL, this project demonstrates capabilities ranging from basic data retrieval to advanced aggregation and optimization techniques.

### Key Objectives
- Analyze customer behavior and purchase patterns.
- Identify the most profitable and popular genres and tracks.
- Explore revenue trends across countries and customer segments.
- Optimize query performance for large datasets.

### Database Schema
The database comprises several interconnected tables:

- customer: Contains customer details, including demographics and contact information.
- employee: Contains details about store employees and their roles.
- invoice: Records customer purchases and their associated details.
- invoice_line: Contains information about proce and quantity
- playlist: Includes curated collections of tracks.
- playlist_track: contains foreign keys: playlist_id and track_id
- artist: Includes information about music artists.
- album: Represents collections of tracks by artists.
- track: Stores details about individual music tracks, including title, composer, and genre.
- genre: Represents the various music genres available in the store.
- media_type: contains type of file 

### Features
1. Basic Analysis: Retrieve and explore fundamental information such as customer lists, track details, and album collections.
2. Intermediate Insights: Aggregate data to uncover trends, such as total revenue by region or the most popular genres, identifying customers who spent more than X dollars, identify the most popular genre by the number of tracks sold
3. Advanced Analysis: Tackle complex questions, including identifying revenue contribution of each employees, identifying custoemrs who purchased tracks from more than 3 different genre, identifying most profitable genre

### Insights and Findings
- The database reveals trends in customer preferences and buying behaviors, helping to identify high-value customers.
- Popular genres and tracks drive significant revenue, offering insights into inventory management and promotional strategies.
- Geographic revenue analysis highlights key markets for targeted marketing campaigns.
- Employee performance analysis sheds light on potential areas for improving customer support and sales efficiency.

### Skills Demonstrated
- SQL Proficiency: Usage of JOINs, GROUP BY, HAVING, and subqueries for meaningful insights.
- Data Aggregation: Summarizing data to derive key business metrics like total revenue and track popularity.
- Data Filtering: Identifying trends using WHERE clauses and DISTINCT queries.
- Optimization: Writing efficient SQL queries to handle large datasets.
- Business Acumen: Formulating insights to answer real-world business questions.

### Tools:
- SQL (MySQL): For database querying and analysis

### Acknowledgments
This project is inspired by the need to understand business insights from a music store database and refine SQL skills. Special thanks to the dataset creators and the open-source community for their resources.

### Contact
For questions or suggestions, please feel free to reach out via GitHub or email.


