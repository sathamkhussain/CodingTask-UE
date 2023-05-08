//
//  NYTimesData.swift
//  TaskSmartDu
//
//  Created by Satham Hussain on 08/05/2023.
//

import Foundation
class NYTimesData: Codable {
        let status : String?
        let copyright : String?
        let num_results : Int?
        let results : [NewsData]?

        enum CodingKeys: String, CodingKey {
            case status = "status"
            case copyright = "copyright"
            case num_results = "num_results"
            case results = "results"
        }

    required init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            status = try values.decodeIfPresent(String.self, forKey: .status)
            copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
            num_results = try values.decodeIfPresent(Int.self, forKey: .num_results)
            results = try values.decodeIfPresent([NewsData].self, forKey: .results)
        }
}


struct NewsData : Codable {
    let uri : String?
    let url : String?
    let id : Int?
    let asset_id : Int?
    let source : String?
    let published_date : String?
    let updated : String?
    let section : String?
    let subsection : String?
    let nytdsection : String?
    let adx_keywords : String?
    let column : String?
    let byline : String?
    let type : String?
    let title : String?
    let abstract : String?
    let des_facet : [String]?
    let org_facet : [String]?
    let per_facet : [String]?
    let geo_facet : [String]?
    let media : [Media]?
    let eta_id : Int?

    enum CodingKeys: String, CodingKey {

        case uri = "uri"
        case url = "url"
        case id = "id"
        case asset_id = "asset_id"
        case source = "source"
        case published_date = "published_date"
        case updated = "updated"
        case section = "section"
        case subsection = "subsection"
        case nytdsection = "nytdsection"
        case adx_keywords = "adx_keywords"
        case column = "column"
        case byline = "byline"
        case type = "type"
        case title = "title"
        case abstract = "abstract"
        case des_facet = "des_facet"
        case org_facet = "org_facet"
        case per_facet = "per_facet"
        case geo_facet = "geo_facet"
        case media = "media"
        case eta_id = "eta_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uri = try values.decodeIfPresent(String.self, forKey: .uri)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        asset_id = try values.decodeIfPresent(Int.self, forKey: .asset_id)
        source = try values.decodeIfPresent(String.self, forKey: .source)
        published_date = try values.decodeIfPresent(String.self, forKey: .published_date)
        updated = try values.decodeIfPresent(String.self, forKey: .updated)
        section = try values.decodeIfPresent(String.self, forKey: .section)
        subsection = try values.decodeIfPresent(String.self, forKey: .subsection)
        nytdsection = try values.decodeIfPresent(String.self, forKey: .nytdsection)
        adx_keywords = try values.decodeIfPresent(String.self, forKey: .adx_keywords)
        column = try values.decodeIfPresent(String.self, forKey: .column)
        byline = try values.decodeIfPresent(String.self, forKey: .byline)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        abstract = try values.decodeIfPresent(String.self, forKey: .abstract)
        des_facet = try values.decodeIfPresent([String].self, forKey: .des_facet)
        org_facet = try values.decodeIfPresent([String].self, forKey: .org_facet)
        per_facet = try values.decodeIfPresent([String].self, forKey: .per_facet)
        geo_facet = try values.decodeIfPresent([String].self, forKey: .geo_facet)
        media = try values.decodeIfPresent([Media].self, forKey: .media)
        eta_id = try values.decodeIfPresent(Int.self, forKey: .eta_id)
    }

}


struct Media : Codable {
    let type : String?
    let subtype : String?
    let caption : String?
    let copyright : String?
    let approved_for_syndication : Int?
    let mediametadata : [MediaMetadata]?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case subtype = "subtype"
        case caption = "caption"
        case copyright = "copyright"
        case approved_for_syndication = "approved_for_syndication"
        case mediametadata = "media-metadata"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        subtype = try values.decodeIfPresent(String.self, forKey: .subtype)
        caption = try values.decodeIfPresent(String.self, forKey: .caption)
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        approved_for_syndication = try values.decodeIfPresent(Int.self, forKey: .approved_for_syndication)
        mediametadata = try values.decodeIfPresent([MediaMetadata].self, forKey: .mediametadata)
    }

}


struct MediaMetadata : Codable {
    let url : String?
    let format : String?
    let height : Int?
    let width : Int?

    enum CodingKeys: String, CodingKey {

        case url = "url"
        case format = "format"
        case height = "height"
        case width = "width"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        format = try values.decodeIfPresent(String.self, forKey: .format)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
    }

}
