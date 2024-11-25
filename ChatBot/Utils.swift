//
//  Utils.swift
//  ChatBot
//
//  Created by Bahdan Rych on 20.11.24.
//

import Foundation

// Take out all dict from file^ for ex bd or json

let schedule: [Int: String] = [
    1: "mas dnes volno",
    2: "18:00-18:55 športové aktivity I Ürgeová Fitko",
    3: "08:25-10:15 programovanie I PMH01 Jurinová \n 10:15-12:05 počítačové siete I PMH01 Šimon \n 13:55-15:45 internetové technológie UCPC605 Hafner",
    4: "08:25-10:15 matematické základy informatiky PMH236 Dirgová Luptáková \n 12:05-13:55 anglický jazyk pre informatikov I ZMH311 Uhlíková \n 13:55-15:45 počítačové siete I UCPC606 Hrinkino \n 15:45-17:35 programovanie I UCPC605 Hafner \n 19:00-19:55  športové aktivity I Ürgeová Plaváreň",
    5: "08:25-10:15 internetové technológie PMH01 Ölvecký \n 10:15-12:05 matematické základy informatiky PMH01 Dirgová Luptáková \n 12:05-13:55 úvod do štúdia informatiky UCPC606 Hafner",
    6: "08:25-10:15 slovenčina ako cudzí jazyk I PMH03 Gregorík",
    7: "mas dnes volno"
]

let responses: [[String]: String] = [
    ["ahoj", "dobre rano", "dobry den", "ahojte", "vitaj"]: "Dobrý deň! Ako ti dnes môžem pomôcť?",
    ["dovidenia", "cau", "bye"]: "Dovidenia! Prajem pekný deň!",
    ["help", "assist", "support"]: "Ak ma chcete kontaktovať, napíšte mi na môj email bogdan.lar@gmail.com",
]

let requiredKeywordResponses: [Set<String>: String] = [
    ["rozvrh", "ponedelok"]: "Toto je váš rozvrh:\n 18:00-18:55 športové aktivity I Ürgeová Fitko",
    ["hodiny", "ponedelok"]: "Toto je váš rozvrh:\n 18:00-18:55 športové aktivity I Ürgeová Fitko",
    ["rozvrh", "utorok"]: "Toto je váš rozvrh:\n 08:25-10:15 programovanie I PMH01 Jurinová \n 10:15-12:05 počítačové siete I PMH01 Šimon \n 13:55-15:45 internetové technológie UCPC605 Hafner",
    ["hodiny", "utorok"]: "Toto je váš rozvrh:\n 08:25-10:15 programovanie I PMH01 Jurinová \n 10:15-12:05 počítačové siete I PMH01 Šimon \n 13:55-15:45 internetové technológie UCPC605 Hafner",
    ["rozvrh", "stredu"]: "Toto je váš rozvrh:\n 08:25-10:15 matematické základy informatiky PMH236 Dirgová Luptáková \n 12:05-13:55 anglický jazyk pre informatikov I ZMH311 Uhlíková \n 13:55-15:45 počítačové siete I UCPC606 Hrinkino \n 15:45-17:35 programovanie I UCPC605 Hafner \n 19:00-19:55  športové aktivity I Ürgeová Plaváreň",
    ["hodiny", "stredu"]: "Toto je váš rozvrh:\n 08:25-10:15 matematické základy informatiky PMH236 Dirgová Luptáková \n 12:05-13:55 anglický jazyk pre informatikov I ZMH311 Uhlíková \n 13:55-15:45 počítačové siete I UCPC606 Hrinkino \n 15:45-17:35 programovanie I UCPC605 Hafner \n 19:00-19:55  športové aktivity I Ürgeová Plaváreň",
    ["rozvrh", "stvrtok"]: "Toto je váš rozvrh:\n 08:25-10:15 internetové technológie PMH01 Ölvecký \n 10:15-12:05 matematické základy informatiky PMH01 Dirgová Luptáková \n 12:05-13:55 úvod do štúdia informatiky UCPC606 Hafner",
    ["hodiny", "stvrtok"]: "Toto je váš rozvrh:\n 08:25-10:15 internetové technológie PMH01 Ölvecký \n 10:15-12:05 matematické základy informatiky PMH01 Dirgová Luptáková \n 12:05-13:55 úvod do štúdia informatiky UCPC606 Hafner",
    ["rozvrh", "piatok"]: "Toto je váš rozvrh:\n 08:25-10:15 slovenčina ako cudzí jazyk I PMH03 Gregorík",
    ["hodiny", "piatok"]: "Toto je váš rozvrh:\n 08:25-10:15 slovenčina ako cudzí jazyk I PMH03 Gregorík",
    ["rozvrh", "subotu"]: "mas dnes volno",
    ["hodiny", "subotu"]: "mas dnes volno",
    ["rozvrh", "nedelu"]: "mas dnes volno",
    ["hodiny", "nedelu"]: "mas dnes volno",
    ["hafner", "super"]: "To je jasno",
]

// Find a safer method to keep pass
let login_strc: [String: String] = [
    "Begarych": "Pass"
]
