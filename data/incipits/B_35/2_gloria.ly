\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    e'8 e16 e e8 g e4 r8 d
    e d c d e4 r
    R1
    r4 r8 fis g a h a
    h4 r r r8 h
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'8 c16 c c8 e c4 r8 g
    c g e g c4 r
    R1
    r4 r8 d d fis g \hA fis
    g4 r r r8 e
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8 c16 c c c c c c4 r8 g
    c g16 g c8 g c4 r
    R1
    r2 g4 r
    g r r2
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c16 c c c e e e e g g g g c8 d
    e16 e g g c c h h c g e g c, d e f
    g d h d g, a h g c h c d e d e fis
    g g d d h h d d g,8 d' g fis
    g16 a h c h a g f e fis gis a \hA gis \hA fis e d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r4 c16 c c c e e e e e8 g
    c16 c d d e e d d e g e g c, d e f
    g d h d g, a h g c h c d e d e fis
    g g d d h h d d g,8 d' g fis
    g16 a h c h a g f e fis gis a \hA gis \hA fis e d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c'4^\tutti c c c,8 g'
    c g e g c,4 r
    R1
    r4 r8 d' g d h d
    g,4 r r r8 e'
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, ter -- ra pax,

  in ter -- ra, ter -- ra
  pax, in
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c'4^\tutti c c c,8 g'
    c g e g c,4 r
    R1
    r4 r8 d g d h d
    g,4 r r r8 e'
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, ter -- ra pax,

  in ter -- ra, ter -- ra
  pax, in
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c4^\tutti c c c,8 g'
    c g e g c,4 r
    R1
    r4 r8 d' g d h d
    g,4 r r r8 e'
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, ter -- ra pax,

  in ter -- ra, ter -- ra
  pax, in
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c'4^\tutti c c c,8 g'
    c g e g c,4 r
    R1
    r4 r8 d g d h d
    g,4 r r r8 e'
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, ter -- ra pax,

  in ter -- ra, ter -- ra
  pax, in
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c'4-\tutti c c c,8 g'
    c g e g c,4 r
    h-\solo r a r
    g' r8 d-\tutti g d h d
    g,4 r gis-\solo r8 e'-\tutti
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r4. <_+>8 r <_+> <6> <_+>
  r2 <6>4. <_+>8
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
