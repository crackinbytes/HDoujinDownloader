function Register()
    module.Name = 'Manhwa18.cc'
    module.Language = 'English'
    module.Adult = true

    module.Domains.Add('manhwa18.cc')
end

function GetInfo()
    info.Title              = dom.SelectValue('//h1/text()[last()]')
    info.AlternativeTitle   = dom.SelectValue('//div[contains(h5/text(), "Alternative")]/following-sibling::div')
    info.Author             = dom.SelectValues('//div[contains(h5/text(), "Author(s)")]/following-sibling::div//a')
    info.Artist             = dom.SelectValues('//div[contains(h5/text(), "Artist")]/following-sibling::div//a')
    info.Tags               = dom.SelectValues('(//div[contains(h5/text(), "Genre(s)")])/following-sibling::div//a')
    info.DateReleased       = dom.SelectValue('//div[contains(h5/text(), "Release")]/following-sibling::div')
    info.Status             = dom.SelectValue('//div[contains(h5/text(), "Status")]/following-sibling::div')
    info.Summary            = dom.SelectValues('//div[contains(@class, "dsct")]//p'):join('\n\n')
end

function GetChapters()
    chapters.AddRange(dom.SelectElements('//div[contains(@class, "panel-manga-chapter")]//li/a'))
    chapters.Reverse()
end

function GetPages()
    pages.AddRange(dom.SelectValues('//div[contains(@class, "read-content")]//img/@src'))
end