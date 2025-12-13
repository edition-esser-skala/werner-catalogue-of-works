\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/2 \tempoMarkup "Adagio"
    r2 f-\tutti r4 f
    f f f2 r
    r f r4 d
    d d d2 r4 d
    d d d2 c~
    c4 f d2 e4 a
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key d \minor \time 3/2 \tempoMarkup "Adagio"
    r2 a-\tutti r4 a
    a a a2 r
    r a r4 b
    b b b2 r4 b
    b b b2 g
    c4 c h4. h8 c4 c
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/2 \tempoMarkup "Adagio"
    r2 a'' r4 a
    a a a2 r
    r a r4 b
    b b b2 r4 b
    b b b2 c~
    c4 c d4. d8 c4 a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/2 \tempoMarkup "Adagio"
    r2 d' r4 d
    d d d2 r
    r f r4 f
    f f f2 r4 f
    f f f2 e
    f f e4 d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/2 \autoBeamOff \tempoMarkup "Adagio"
    d'2 r4 d d d
    d2 r4 d d d
    d2 r f
    r4 f f f f2
    r4 f f f e2
    f1 e4 d
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, et
  in ter -- ra pax,
  in ter -- ra pax,
  pax, pax "ho -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/2 \autoBeamOff \tempoMarkup "Adagio"
    f2 r4 f f f
    f2 r4 f f f
    f2 r d
    r4 d d d d2
    r4 d d d c2~
    c4 f d4. d8 e4 a
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, et
  in ter -- ra pax,
  in ter -- ra pax __
  ho -- mi -- ni -- bus, "ho -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 3/2 \autoBeamOff \tempoMarkup "Adagio"
    a2 r4 a a a
    a2 r4 a a a
    a2 r b
    r4 b b b b2
    r4 b b b g2
    c4 c h4. h8 c4 c
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, et
  in ter -- ra pax,
  in ter -- ra pax,
  pax ho -- mi -- ni -- bus, "ho -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 3/2 \autoBeamOff \tempoMarkup "Adagio"
    d2^\tutti r4 d d d
    d2 r4 d d d
    d2 r b
    r4 b b b b2
    r4 b b b b2
    a4 f g4. g8 c4 f
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, et
  in ter -- ra pax,
  in ter -- ra pax,
  pax ho -- mi -- ni -- bus, "ho -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/2 \tempoMarkup "Adagio"
    d2.-\tutti d4 d d
    d2. d4 d d
    d1 b2~
    b4 b b b b2~
    b4 b b b b2
    a4 f g2 c4 f
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  r
  r1 <4 2>2
  r <7 _!>1
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "trb"
        \new Staff {
          \set Staff.instrumentName = "1"
          \TromboneI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \TromboneII
        }
      >>
    >>
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
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
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
