\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'4 r c r8 e
    d4 r d r
    R1
    d4 r r2
    e4 r r2
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    e4 r e r8 c
    g'4 r g r
    R1
    g4 r r2
    e4 r r2
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c4 r r2
    g4 r r2
    R1*3
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r16 g c g e' c g' e c' g e' c g' e c' e,
    \kneeBeam d g,, h g d' h g' d h' g d' h g' d h' d,
    c a, c a e' c a' e c' a e' c fis c a' c,
    h g, h g d' h g' d h' g d' h g' d h' d,
    cis a, cis a e' cis g' e cis' a e' cis g' e cis a'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r8 c e g c e g c
    d, h, d g h d g h
    c, c, e a c e fis a
    h, h, d g h d g h
    cis, cis, e g cis e g e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 e'2^\tutti e4
    g2 d
    c2. c4
    h h2 h4
    cis2 cis
  }
}

SopranoLyrics = \lyricmode {
  Do -- mum
  tu -- am,
  Do -- mi --
  ne, de -- cet,
  de -- cet
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 g'2^\tutti g4
    g2 g
    g2. fis4
    g g2 g4
    g2 g
  }
}

AltoLyrics = \lyricmode {
  Do -- mum
  tu -- am,
  Do -- mi --
  ne, de -- cet
  de -- cet
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 c2^\tutti c4
    d2 d
    e2. c4
    d2 d4 d
    e2 e
  }
}

TenoreLyrics = \lyricmode {
  Do -- mum
  tu -- am,
  Do -- mi --
  ne, de -- cet,
  de -- cet
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 c'2^\tutti c4
    h2 h
    a2. a4
    g2 f4 f
    e2 e
  }
}

BassoLyrics = \lyricmode {
  Do -- mum
  tu -- am,
  Do -- mi --
  ne, de -- cet,
  de -- cet
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\tutti ^\markup \remark "staccato per tutto" c c c c c c c
    h h h h h h h h
    a a a a a a a a
    << { g' g g g } \\ { g,4 s } >> f'8 f f f
    e e e e e e e e
  }
}

BassFigures = \figuremode {
  r1
  r
  <7>2. <6\\>4
  r2 <6 4 2>
  <6\\>1
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "clno" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = "timp"
      \Timpani
    }
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
