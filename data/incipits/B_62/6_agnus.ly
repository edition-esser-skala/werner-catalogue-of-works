\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*2
    g''8 fis16 g h8 h h cis, a'16 g g8 \gotoBar "8"
    \clef soprano g,4 g e' d8 c
    h a h d e4 d8 e
    c2 h
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    d'8 c16 d e8 e e fis, d'16 c c8
    h4 d16 e32 fis g16 g g8 fis g e
    d4 r8 d cis16 d e4 a,8 \gotoBar "8"
    \clef soprano g4 g e' d8 c
    h a h d e4 d8 e
    c2 h
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*3 \gotoBar "8"
    g'4^\tutti g e' d8 c
    h[ a] h d e4 d8[ e]
    c2 h
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di:
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*3 \gotoBar "8"
    d4^\tutti e g fis8 a
    g4 g8 g g4 g
    e fis d2
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- _ di:
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*3 \gotoBar "8"
    h4^\tutti h c a8 d
    d4 d8 h c4 h
    a2 g
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di:
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*3 \gotoBar "8"
    g'8[^\tutti fis] e[ d] c4 d8 fis
    g4 g,8 g' c,4 g'8 g
    a4 d, g g,
  }
}

BassoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis, qui tol -- lis pec --
  ca -- ta mun -- di:
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    g'4-\solo c,8 c' d,4 fis8 e16 fis
    g8 a h4 a h8 c
    h4 g8 g, a4 cis \gotoBar "8"
    g'8-\tutti fis e d c4 d8 fis
    g4 g,8 g' c,4 g'
    a d, g g,
  }
}

BassFigures = \figuremode {
  r2 <9>4 <6>8 q
  r4 q r8 <6> r4
  <6>2 <9>4 <6>8 r
  r1
  r
  r4 <7>2.
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
