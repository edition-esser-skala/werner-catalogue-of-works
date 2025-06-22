\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    R1*2
    g''8. f16 e f d e f8 c f4~
    f16 g e f d4~ d16 e c d h4
    a r r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    R1*2
    r2 c'8. b16 a b g a
    f8 a gis a h16 c a \hA h gis4
    a r r2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    a'4^\solo a d8[ b] g a16[ b]
    a4 a8 c d c c[ h]
    c4 r r2
    r r4 h8 h
    c4 c8 c c4 b16[ c] a8
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di:
  A -- gnus
  De -- i, qui tol -- lis "pec -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    f4^\solo f f8[ g] e8. e16
    f4 f8 g a g f4
    e r r2
    r r4 e8 e
    e4 e8 es d d r d
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di:
  A -- gnus
  De -- i, qui tol -- lis "pec -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    d4.^\solo c8 b4 c8 c
    f, f f'[ e] f e d4
    c r r2
    r r4 e8 e,
    a4 a8 g! fis fis r \hA fis
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di:
  A -- gnus
  De -- i, qui tol -- lis "pec -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*2
    r4 c'8.^\solo b16 a[ b g a] f[ g e f]
    d[ e c d] h[ c a \hA h] gis8 a e'4
    a, r r2
  }
}

BassoLyrics = \lyricmode {
  Mi -- se -- re -- _
  _ _ _ re no --
  bis.
}

Organo = {
  \relative c {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    d'4.-\solo c8 b4 c
    f, f'8 e f e d4
    c \clef bass c8. b16 a8 g f e
    d c h a gis a e'4
    a, \clef tenor a'8 g! fis4. fis8
  }
}

BassFigures = \figuremode {
  r2 <5>8 <6>4.
  r q8 q q <7> <6!>
  r1
  r4 <6\\> <6 5> r
  r4. <6- 4>8 <6 5>2
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
        \set Staff.instrumentName = "b"
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
