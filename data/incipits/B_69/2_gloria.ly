\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Allegro moderato"
    c''4 c,8 d e e d d e e fis fis
    g4 g,8 a h h a a h h cis cis
    d4 d8 e f! f e e f f gis gis
    a4 a,8 h c c h h c c d d
    e h' a h gis a fis \hA gis e f d e
    c a' g a f g e f d e c d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Allegro moderato"
    c''4 c,8 d e e d d e e fis fis
    g4 g,8 a h h a a h h cis cis
    d4 d8 e f! f e e f f gis gis
    a4 a,8 h c c h h c c d d
    e h' a h gis a fis \hA gis e f d e
    c a' g a f g e f d e c d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro moderato"
    g'2. g4 g c
    h2. a4 h cis
    d a2 a4 a d
    c c2 h4 c d
    e2 e e
    e c d
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni --
  bus bo -- nae vo -- lun --
  ta -- tis. Lau -- da -- mus
  te, be -- ne --
  di -- ci -- mus
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro moderato"
    e2. d4 e fis
    g2. a4 g g
    f!4 f2 e4 f gis
    a a2 h4 a a
    gis2 gis h
    e, f f
  }
}

AltoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni --
  bus bo -- nae vo -- lun --
  ta -- tis. Lau -- da -- mus
  te, be -- ne --
  di -- ci -- mus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro moderato"
    c2. d4 c c
    d2. d4 d e
    a, d2 e4 d d
    e e2 e4 a, a
    h2 h h
    c a a
  }
}

TenoreLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni --
  bus bo -- nae vo -- lun --
  ta -- tis. Lau -- da -- mus
  te, be -- ne --
  di -- ci -- mus
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro moderato"
    c'2. h4 c a
    g2. f4 g e
    d d2 c4 d h
    a a'2 gis4 a f
    e2 e gis
    a2. a4 f2
  }
}

BassoLyrics = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni --
  bus bo -- nae vo -- lun --
  ta -- tis. Lau -- da -- mus
  te, be -- ne --
  di -- ci -- mus
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Allegro moderato"
    c2. h4 c a
    g g'2 f4 g e
    d2. c4 d h
    a a'2 gis4 a f
    e2 e gis
    a1 f2
  }
}

BassFigures = \figuremode {
  r1 r4 <6\\>
  r1 r4 <6\\>
  r1 r4 <6\\>
  r1 r4 <6>
  <_+>1.
  <5>2 <6> q
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
