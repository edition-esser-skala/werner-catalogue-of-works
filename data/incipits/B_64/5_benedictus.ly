\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 d'^\solo a
    f'2 e4
    r d c!
    b4. b8 a4~
    a g8[ f] g4
    a2 r4
    r a2
  }
}

SopranoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus,
  be -- ne --
  di -- ctus, qui __
  ve -- _
  nit,
  qui
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R2.*2
    r4 a'^\solo g
    f2 e4
    d d2
    cis4 e2
    f4 f f
  }
}

AltoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus,
  qui ve --
  nit, qui
  ve -- nit, qui
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R2.
    r4 \mvTr d^\solo a
    f'2 e4
    r d c!
    b2.
    a2 a4
    d8[ e d c! b! a]
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne --
  di -- ctus,
  be -- ne --
  di --
  ctus, qui
  "ve -"
}

Organo = {
  \relative c {
    \clef tenor
    \key d \minor \time 3/4 \tempoMarkup "[no tempo]"
    d'8-\solo e f4 cis
    d2 a4
    f'2 e4
    d2 c!4
    b2.
    a8 h cis4 a
    d8 e d c b a
  }
}

BassFigures = \figuremode {
  r4 <6>2
  r <_+>4
  <6>2 <6!>4
  <6>2 q4
  <7> <6>2
  r2.
  r
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
