\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Tempo ordinario · Largo"
    c'4 d2 es8 es
    e4 f8 f f2~
    f4 e r2
    R1
    r8 g,4 a8 g c g as~
    as g g4 r e'8 e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Tempo ordinario · Largo"
    a'4 b h c8 c
    cis4 d8 d d2~
    d4 cis r2
    R1
    r8 e,4 f8 e16 d e4 f8
    f4 e c'8 c c4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario · Largo"
    a'4^\tutti b h c8 c
    cis4 d8 d d d d4~
    d cis r8 c4^\solo d8
    c f c des des[ c] c4
    r8 g4^\tutti a8 g c g as
    as[ g] g4 c8 c c4
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di: Mi -- se --
  re -- re, mi -- se -- re -- re,
  mi -- se -- re -- re, mi -- se --
  re -- re, mi -- se -- "re -"
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario · Largo"
    f4.^\tutti f8 f4 es8 es
    e4 f8 f f d f4~
    f e r8 a4^\solo b8
    a16[ g] a8 a b b4 a
    r8 e4^\tutti f8 e16[ d] e8 e f
    f4 e r e8 e
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di: Mi -- se --
  re -- re, mi -- se -- re -- re,
  mi -- se -- re -- re, mi -- se --
  re -- re, mi -- "se -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario · Largo"
    c4^\tutti d d8 g,4 a8
    a a4 a8 a a gis4
    a2 f'4.^\solo f8
    f2 e4 f
    r8 c4^\tutti c8 c c c d
    d4 c r a!8 a
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di: Mi -- se --
  re -- _ re,
  mi -- se -- re -- re, mi -- se --
  re -- re, mi -- "se -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario · Largo"
    f4.^\tutti f8 g4 c,8 c
    a'4 f8 d b b b4
    a2 r
    R1
    c'4. c8 c2
    h4 c a!4. a8
  }
}

BassoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di:

  Mi -- se -- re --
  _ re, mi -- "se -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Tempo ordinario · Largo"
    f2-\tutti g4 c,
    a' f8 d b2
    a \clef tenor f''4.-\solo f8
    f2 e4 f
    \clef bass c4.-\tutti c8 c2
    h4 c a!4. a8
  }
}

BassFigures = \figuremode {
  <5 3>4 <6 4> <7 _!> <5 _->8 <6 \t>
  <_+>4 <6> <7 5> <6\\ \t>
  <8 6 4> <_ 5 _+> <5 3>4. <6 4>8
  <#(dotbf 5) #(dotbf 3)>4. <6- 4>8 <7- 5> <6 \t> <5 3>4
  <5 3>4. <6 4>8 <#(dotbf 5) #(dotbf 3)>4. <6- 4>8
  <7- 5> <6 \t> <5 3>4 <_!>2
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
