\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    d'4.^\solo a8 f'8. e16 d4
    r8 d c!16[ g] a[ b] a8 b16 c d4
    g, r8 e' a, c16 c f8 d
    d b c4. c8 f4~
    f8 e16 e d4 e r
  }
}

SopranoLyrics = \lyricmode {
  Ni -- si Do -- mi -- nus
  ae -- di -- fi -- ca -- ve -- rit do --
  mum, in va -- num la -- bo -- ra --
  ve -- runt qui ae -- di --
  fi -- cant e -- am.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*4
    d8^\solo c c8. h16 c8 c16 d e8 d16 e
  }
}

TenoreLyrics = \lyricmode {
  Ni -- si Do -- mi -- nus cu -- sto -- di -- e -- rit
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    d8-\solo f16 e d8 cis d e f fis
    g d e c f f, b4
    c8 c' e, c f, f' b, b'
    g4 e8 c' a f d d'
    h c g g, c c'4 b8
  }
}

BassFigures = \figuremode {
  r1
  r8 <6> q2 q8 <5>
  r1
  r4 <6>2.
  <6 5>4 <4>8 <_!> r2
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
