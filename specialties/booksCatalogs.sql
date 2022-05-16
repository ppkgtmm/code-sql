SELECT ExtractValue(xml_doc, '/catalog/book[1]/author') AS author
FROM catalogs
ORDER BY author;