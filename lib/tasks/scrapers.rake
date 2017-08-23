namespace :scrapers do
  desc 'parse belchip.by'
  task belchip: :environment do
    agent = Mechanize.new
    limit = 100000
    limit.times do |id|
      id = id.to_s.rjust(5, '0')
      url = "http://belchip.by/product/?selected_product=#{id}"
      page = agent.get(url)
      if page.title != 'Страница не найдена'
        document = Document.find_or_create_by(vendor_id: id)
        document.update(
          vendor_id: id,
          url: url,
          title: page.search('h1').text,
          description: page.search('.full-description .full-l').
            last.
            children.
            map{ |node| node.text.strip }.
            reject(&:blank?).
            join(' ')
        )
      end
      print("#{id}/#{limit}\r")
    end
  end

  desc "TODO"
  task ruchip: :environment do
  end

end
