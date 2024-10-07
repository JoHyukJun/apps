//
//  ArtistModel.swift
//  Musiqueue
//
//  Created by johyukjun on 10/7/24.
//

import Foundation


struct Artist: Identifiable, Codable {
    let id: Int
    let name: String
    let uri: String
    let profile: String
    let urls: [String]
    
    static let sampleArtist = Artist(id: 17827, name: "Eric Clapton", uri: "https://www.discogs.com/artist/17827-Eric-Clapton", profile: "Prolific English blues-rock guitarist, singer, songwriter/composer, and producer, affectionately known as \"Slow Hand\". Born 30 March, 1945 in Ripley, Surrey, England, UK.\r\n\r\nEarly career timeline:\r\n[a=The Yardbirds] October 1963-March 1965.\r\n[a=John Mayall & The Bluesbreakers] April 1965-June 1965; October 1965-July 1966.\r\n[a=Eric Clapton And The Powerhouse] March 1966.\r\n[a=Cream (2)] July 1966-May 1968.\r\n[a=Blind Faith (2)] 8 February 1969-August 1969.\r\n[a=Derek & The Dominos] Spring 1970-1971\r\n\r\nHis holding company was [l267110] from 20 October 1967 to 6 November 2018.\r\nRecipient of eighteen Grammy, four Ivor Novello awards, and the Brit Award for Outstanding Contribution to Music.\r\nThree times inducted into Rock And Roll Hall of Fame in 2000 (Solo artist, Performer with [a=The Yardbirds], Performer with [a=Cream (2)]). Inducted into Songwriters Hall of Fame in 2001.\r\nReceived the Order of the British Empire (CBE-Commander) in 2004.\r\nSon of [a=Patricia Molly Clapton] but he was raised by her mother [a=Rose Clapp] after giving birth at age sixteen. His partner from late 1960s to 1974 was [a=Alice (58)]. Married to [a1401442] from 27 March 1979 (in Tucson, AZ, USA) to 1989. In 1984, he began a relationship with [a=Yvonne Kelly]. Although they were married to other partners at the time, they had a daughter together, [a=Ruth Kelly-Clapton] (born in January 1985); her existence was kept from the public until the media realised she was his child in 1991. He had an affair with Italian model [a=Lorry Dal Santo] who gave birth to their son, Conor (21 August 1986 - 20 March 1991). He married [a=Melia Clapton] (n\u{00e9e} McEnery) on 1 January 2002 in his birthplace; together they have three daughters, [a=Julie Clapton], [a=Ella Clapton], and [a=Sophie Clapton].", urls: ["https://ericclapton.com/", "https://www.facebook.com/ericclapton", "https://twitter.com/EricClapton", "https://www.instagram.com/ericclapton/", "https://www.youtube.com/channel/UCtCOFqqGGGunX71nfZgPQOQ", "https://soundcloud.com/ericclapton", "https://en.wikipedia.org/wiki/Eric_Clapton", "https://whereseric.com/", "http://eric-clapton.co.uk/", "https://clapton.ne.jp/", "https://clapton.jp/", "https://www.biography.com/musicians/eric-clapton", "https://whatgear.com/pro/eric-clapton", "https://www.last.fm/music/Eric+Clapton", "https://www.imdb.com/name/nm0002008/"])
}
