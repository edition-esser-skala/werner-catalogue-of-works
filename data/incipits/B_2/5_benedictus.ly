\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c'4.^\aTre f8 e4 e8 d
    c[ h] c4 r8 g g[ a]
    h16[ c h c] d8 g, g4 r8 c\p
    h16[ c h c] d8 g, g4 r8 c\f
    h[ c] h d c2~
    c4 h c2\fermata
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne -- di -- ctus, qui
  ve -- nit in no --
  _ _ mi -- ne, in
  no -- _ mi -- ne, in
  no -- mi -- ne Do --
  mi -- ni.
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r2 e4.^\aTre a8
    g4 g8 f e[ d] e4
    d r8 e d[ e d] e16[ fis]
    g4 r8 e\p d[ e d] e16[ fis]
    g4 r8 a\f g[ a] g f16[ e]
    f4. f8 e2\fermata
  }
}

AltoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve -- _
  nit in no -- mi --
  ne, in no -- mi --
  ne, in no -- mi -- ne
  Do -- mi -- ni.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r2 c4.^\aTre f8
    e4 e8 d c[ h] c4
    g r8 c h[ c] h[ a]
    g4 r8 c\p h[ c] h[ a]
    g4 r8 f\f e[ f] e d16[ c]
    d4. d8 c2\fermata
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve -- _
  nit in no -- mi --
  ne, in no -- mi --
  ne, in no -- mi -- ne
  Do -- mi -- ni.
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Allegro"
    c'8-\aTre c, e d c \clef tenor c'4 f8
    e4. d8 c h c4
    g r8 c h c h a
    g4 r8 c\p h c h a
    g4 r8 f\f e f e d16 c
    d2 c\fermata
  }
}

BassFigures = \figuremode {
  r2.. <6>8
  <6 3> <5> <6> q4 r4.
  r2.. <6\\>8
  r2.. <6\\>8
  r4. <6>8 q2
  <7>4 <6>2.
}

\score {
  <<
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
