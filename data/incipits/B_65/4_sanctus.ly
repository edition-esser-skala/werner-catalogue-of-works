\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/4 \tempoMarkup "Adagio"
    f'2 a
    r\fermata f
    g r\fermata
    g a
    \tempoMarkup "Presto" R1*4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/4 \tempoMarkup "Adagio"
    d'2 cis
    r\fermata c
    c r\fermata
    b a\fermata
    \tempoMarkup "Presto" R1*4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d'2^\tutti cis
    r\fermata c
    c r\fermata
    b a\fermata
    \tempoMarkup "Presto" R1*4
  }
}

SopranoLyrics = \lyricmode {
  San -- ctus,
  san --
  ctus,
  san -- ctus,
}

Alto = {
  \relative c' {
    \clef alto
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    f2^\tutti e
    r\fermata f
    e r\fermata
    g fis\fermata
    \tempoMarkup "Presto" R1*3
    r2 r4 c
  }
}

AltoLyrics = \lyricmode {
  San -- ctus,
  san --
  ctus,
  san -- ctus,

  "san -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    a2^\tutti a
    r\fermata a
    g r\fermata
    d' d\fermata
    \tempoMarkup "Presto" a2 h!
    c d
    e4 e f8[ e d c]
    b4 a g2
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus,
  san --
  ctus,
  san -- ctus,
  san -- _
  _ _
  ctus, san -- _
  _ ctus, "san -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d2^\tutti a
    r\fermata f'
    c r\fermata
    g' d\fermata
    \tempoMarkup "Presto" r4 d2 e4~
    e f2 g4~
    g a a8[ g f e]
    d[ e] f2 e4
  }
}

BassoLyrics = \lyricmode {
  San -- ctus,
  san --
  ctus,
  san -- ctus,
  san -- _
  _ _
  ctus, san --
  _ _ \hy
}

Organo = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/4 \tempoMarkup "Adagio"
    d2-\tutti a
    r\fermata f'
    c r\fermata
    g' d\fermata
    \tempoMarkup "Presto" << { a'2 } \\ { r4 d,2 } >> e4~
    e f2 g4~
    g a a8 g f e
    d e f2 e4
  }
}

BassFigures = \figuremode {
  r2 <_+>
  r1
  r
  <_->2 <_+>
  r2 <6!>4 <5>
  <6> <5> <6> <5>
  <6> <5> <6>8 q q q
  <6-> <5> <3>4 <2> <6>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName =  \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName =  \markup \center-column { "T" "trb 2" }
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
