module WebServiceClients

  # Client for ISBNDB http://isbndb.com/
  class IsbndbClient
    require 'open-uri'
    def self.find isbn
      doc = Nokogiri::XML(open "http://isbndb.com/api/books.xml?access_key=#{ENV['ISBNDB_ACCESS_KEY']}&index1=isbn&value1=#{isbn}")
      {
        isbn: doc.xpath("//BookData").attr("isbn").value,
        isbn13: doc.xpath("//BookData").attr("isbn13").value,
        title: doc.xpath("//Title").text,
        title_long: doc.xpath("//TitleLong").text,
        authors: doc.xpath("//AuthorsText").text,
        publisher: doc.xpath("//PublisherText").text,
        publisher_id: doc.xpath("//PublisherText").attr("publisher_id").value
      }
    end
  end

end
