\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    r2 c'8\p e16 d c8 h
    c h c16 e d c h4 r
    R1*3
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    r2 a'8\p c16 h a8 gis
    a gis a16 e a8 gis4 r
    R1*3
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1
    r4 r8 e'^\solo e e16 e e8 e
    e e, h' e e16[ c] h a \grace c8 h4
    a r r2
    R1
  }
}

SopranoLyrics = \lyricmode {
  in va -- num la -- bo -- ra -- %2
  ve -- runt qui ae -- di -- fi -- cant e --
  am.

}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*4
    g'8^\solo d h a16 g e'4 r8 e
  }
}

AltoLyrics = \lyricmode {
  fru -- stra vi -- gi -- lat qui "cu -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*2
    r2 r8 a4^\solo gis8
    c c16 c h8 cis d f16 e d8 c
    c h r4 r2
  }
}

TenoreLyrics = \lyricmode {
  Ni -- si
  Do -- mi -- nus cu -- sto -- di -- e -- rit ci -- vi --
  ta -- tem,
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    a'8^\solo c16[ h] a8 e a,8. a16 a8 e'
    a e c h16 a e'8 e r4
    R1*2
    r2 c'8 g e d16 c
  }
}

BassoLyrics = \lyricmode {
  Ni -- si, ni -- si Do -- mi -- nus ae --
  di -- fi -- ca -- ve -- rit do -- mum,

  fru -- stra vi -- gi -- lat
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
    a'8-\solo c16 h a8 e a,4. e'8
    a e c h16 a e'8 gis16 fis \hA gis8 e
    a16 c h a gis f? e d c8 f d e
    a, a' g e f d f a
    g4 g,8 h' c g e c
  }
}

BassFigures = \figuremode {
  r4. <_+>2 q8
  r q4. q2
  r2. <6 5>8 <_+>
  r4. <6\\>8 <6>4. <3>8
  <4> <3>2 <\t>4.
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
