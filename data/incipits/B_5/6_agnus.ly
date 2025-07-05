\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Tempo ordinario"
    g''2. g4 g g
    g2 g r4 g
    a2 a r4 g
    g1 fis2
    g r r
    R1.*2
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Tempo ordinario"
    e'2. d4 c d
    e2 e r4 e
    c2 c r4 e
    d2 c2. c4
    d2 r r
    R1.*2
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Tempo ordinario"
    c4 c8 c c4 g c g
    c2 c r4 c8 c
    c2 c r4 c
    g g c c8 c c4 c
    g2 r r
    R1.*2
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Tempo ordinario"
    e'2. g2 h4
    \kneeBeam c8 e,, g e c' g e' c g'4 c
    a8 f, a f c' a f' c a'4 c
    h8 g, h g c a e' c a'4 c,
    h2 r r
    r4 g2 g4 a h
    c1 h2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Tempo ordinario"
    c'2. d4 e d
    e8 c, e c g' e c' g e'4 e
    c8 a c a f a c a f'4 e
    d8 h d h c a e' c a'4 c,
    h2 r r
    r4 e,2 e4 fis g
    a1 g2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo ordinario"
    c'2.^\tutti h4 c d
    e2 e r4 e
    c2 c r4 e
    d d c1
    h2 r r
    r4 g2 g4 a h
    c1 h2
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus, a -- gnus
  De -- i, qui
  tol -- lis pec --
  ca -- ta mun --
  di:
  Mi -- se -- re -- re
  no -- \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo ordinario"
    g'2.^\tutti g4 g g
    g2 g r4 g
    f2 f r4 g
    g g g2 fis
    g r r
    r4 e2 e4 fis g
    a1 g2
  }
}

AltoLyrics = \lyricmode {
  A -- gnus, a -- gnus
  De -- i, qui
  tol -- lis pec --
  ca -- ta mun -- _
  di:
  Mi -- se -- re -- re
  no -- \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo ordinario"
    e2.^\tutti d4 c h
    c2 c r4 c
    a2 a r4 c
    h h c1
    d4 h2 h4 c d
    e1 d2
    c4 c2 c4 d e
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus, a -- gnus
  De -- i, qui
  tol -- lis pec --
  ca -- ta mun --
  di: Mi -- se -- re -- re
  no -- _
  bis, mi -- se -- re -- re
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo ordinario"
    c'2.^\tutti g4 e g
    c,2 c r4 c
    f2 f r4 c
    g' g a1
    g4 g2 g4 a h
    c c, c'2. h4
    a a,2 a4 h c
  }
}

BassoLyrics = \lyricmode {
  A -- gnus, a -- gnus
  De -- i, qui
  tol -- lis pec --
  ca -- ta mun --
  di: Mi -- se -- re -- re
  no -- _ _ _
  bis, mi -- se -- re -- re
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Tempo ordinario"
    c'2.-\tutti g4 e g
    c,2 c r4 c
    f2 f r4 c
    g'2 a1
    g2. g,4 a h
    c2 c'2. h4
    a a,2 a4 h c
  }
}

BassFigures = \figuremode {
  r1 <6>2
  r1.
  r
  r2 <7> <6\\>
  r2. <3>4 q q
  r2 <3> <4\+ 2>4 <6>
  r1 q2
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { \transposedNameShort "clno" "C" "" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = \transposedTimp "C" "" "G" ""
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
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "trb 2" }
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
