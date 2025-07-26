\version "2.24.2"
\include "header.ly"

CornoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
      \once \override Staff.TimeSignature.style = #'single-digit
    e'8. e32 e32 \pa e8 g4 c8 \pd
    h8. h32 h h8 h g h
    c r g r g r
    a r f r a r
    g d16 d d8 d d4
  }
}

CornoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
      \once \override Staff.TimeSignature.style = #'single-digit
    c'8. c32 c c8 e g e
    d8. d32 d d8 d d g
    e r c r e r
    c r d r d r
    d g,16 g g8 g g4
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
      \once \override Staff.TimeSignature.style = #'single-digit
    c'16 g' e g c g e g c g e g
    d g, h d g d h d g d h d
    e e( f g) r c,( d e) r g,( a b)
    r a' h c r f,( g a) r d,( e f)
    h,! d g d h' g d' h g d h g'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
      \once \override Staff.TimeSignature.style = #'single-digit
    c'16 g' e g c g e g c g e g
    d g, h d g d h d g d h d
    e e( f g) r c,( d e) r g,( a b)
    r a' h c r f,( g a) r d,( e f)
    h,! d g d h' g d' h g d h g'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
      \once \override Staff.TimeSignature.style = #'single-digit
    e'4^\tutti r8 e g e
    d4 r8 d g d
    e r g r e r
    c r f4 d
    h4. h8 h4
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, pax, pax,
  pax, pax ho --
  mi -- ni -- bus
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
      \once \override Staff.TimeSignature.style = #'single-digit
    g'4^\tutti r8 g g g
    g4 r8 g g g
    g r g r g r
    a r a4 a
    g4. g8 g4
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, pax, pax,
  pax, pax ho --
  mi -- ni -- bus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
      \once \override Staff.TimeSignature.style = #'single-digit
    c4^\tutti r8 c g c
    h4 r8 h d h
    c r c r c r
    a r d4 d
    d4. d8 d4
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, pax, pax,
  pax, pax ho --
  mi -- ni -- bus
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
      \once \override Staff.TimeSignature.style = #'single-digit
    c4^\tutti r8 c' e, c
    g'4 r8 g h, g
    c r e r c r
    f r d4 f?
    g4. g,8 g4
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, pax, pax,
  pax, pax ho --
  mi -- ni -- bus
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Allegro"
      \once \override Staff.TimeSignature.style = #'single-digit
    c4-\tutti r8 c' e, c
    << { g'4^\markup \remark "vlne" } \\ { g,_\org } >> r8 g' h, g
    c-! r e-! r c-! r
    f-! r d-! r f-! r
    g4. g,8 g4
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r2 <6>4
  r2.
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "cor" "1, 2" }
        \partCombine #'(0 . 10) \CornoI \CornoII
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
