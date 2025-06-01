\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Allegretto"
    a'8. a16 c8 a16 c e h' gis e h'8 e,
    f e4 f8 e16 h e gis h \hA gis e h
    cis a \hA cis e f d f a g d e c g8 h
    c4 r r2
    R1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Allegretto"
    a'8. a16 c8 a16 c e h' gis e h'8 e,
    f e4 f8 e16 h e gis h \hA gis e h
    cis a \hA cis e f d f a g d e c g8 h
    c4 r r2
    R1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "Allegretto" \autoBeamOff
    a'8.^\tutti a16 c8 a e' e r e
    f e e[ f] e h4 e8
    cis8. cis16 d8 d h c? c h
    c g^\solo c e16[ f] g8 g, f4
    e r r2
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei -- son, Chri --
  ste e -- lei -- son, Chri -- ste
  au -- di nos, Chri -- ste ex -- au -- di
  nos. Pa -- ter de coe -- lis, De --
  us,
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \tempoMarkup "Allegretto" \autoBeamOff
    r2 e4.^\tutti h'8
    a h a[ a,] h4 r8 e
    e4 r8 f f e d8. d16
    e4 r r2
    r8 e4^\solo d16 c d8 d c16[ h] c8
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri --
  e e -- lei -- son, Chri --
  ste, Chri -- ste ex -- au -- di
  nos.
  Fi -- li, Re -- dem -- ptor mun -- di,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \tempoMarkup "Allegretto" \autoBeamOff
    r2 h4.^\tutti h8
    c h c4 h r8 gis
    a4 r8 a g g g8. g16
    g4 r r r8 d'~^\solo
    d c16 h c8 c c h h[ a]
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri --
  e e -- lei -- son, Chri --
  ste, Chri -- ste ex -- au -- di
  nos. Fi --
  li, Re -- dem -- ptor mun -- di, "De -"
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Allegretto" \autoBeamOff
    r2 gis'8.^\tutti gis16 e8 \hA gis
    a[ gis] a4 \hA gis r8 e
    a4 r8 d, g c,! g8. g16
    c4 r g'8.^\solo g16 a8 h
    c c, r4 g'8 gis a a,
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- _ son, Chri --
  ste, Chri -- ste ex -- au -- di
  nos. mi -- se -- re -- re
  no -- bis, mi -- se -- re -- re
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Allegretto"
    a4-\tutti r8 a' gis4 e8 \hA gis
    a gis a4 \hA gis r8 e
    a4 r8 d, g c,! g4
    c r8 c-\solo h e a, h
    c4. c'8 g gis a a,
  }
}

BassFigures = \figuremode {
  r1
  <6>8 q <5> <6> q4. <_+>8
  q2 <7>4 <4>8 <3>
  r2. <6>4
  <9>8 <8>4. <5 4>8 <\t 3> <9 4> <8 3>
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
