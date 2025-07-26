\version "2.24.2"
\include "header.ly"

aTre = \markup \remark "a 3"

CornoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    \pa e'8 g16 f e8 d \pd e16 d e8 r \pao e
    e e r g a16 g a8 r a
    \pa g4. fis8 \pd g4 r
    R1*2
  }
}

CornoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c'4. g8 c16 h c8 r e
    c c r e f16 e f8 r f
    d e d c d4 r
    R1*2
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    e'16 c g'8~ g16 c h d c h32 a g f e d c16 e8 gis16
    a g32 f e d c h a16 c8 e16 f e32 d c h a g f16 a8 d16~
    d g8 e16 d g8 fis16 g \hA fis32 e d c h a g16 h d, g
    h,4 r r2
    R1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    e'16 c g'8~ g16 c h d c h32 a g f e d c16 e8 gis16
    a g32 f e d c h a16 c8 e16 f e32 d c h a g f16 a8 d16~
    d g8 e16 d g8 fis16 g \hA fis32 e d c h a g16 h d, g
    h,4 r r2
    R1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    e'8[^\tutti g16 f] e8 d c16[ h] c8 r h
    c16[ h] c8 r g! a16[ g] a8 r a
    d c h[ c] h4 r
    h8.[^\solo^\aTre c32 d] e8 h c4 cis8.[\trill h32 \hA cis]
    d4. c8 b d16[ c] \hA b8 a
  }
}

SopranoLyrics = \lyricmode {
  A -- _ gnus De -- i, qui
  tol -- lis pec -- ca -- ta, pec --
  ca -- ta mun -- di:
  Mi -- _ se -- re -- re
  no -- bis, mi -- se -- re -- re
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    g'4.^\tutti g8 g g r gis
    a16[ gis] a8 r e f16[ e] f8 r f16[ a]
    g8 g g[ fis] g4 r
    r8 e4^\solo^\aTre e8 e[ f] f4
    f fis g8 d4 d8
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta, pec --
  ca -- ta mun -- di:
  Mi -- se -- re -- re
  no -- _ bis, mi -- "se -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    c4.^\tutti d8 e16[ d] e8 r e
    e e r c c c r f
    d e d([ c)] d4 r
    gis,4.^\solo^\aTre gis8 a4 a
    b a g4. f!8
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta, pec --
  ca -- ta mun -- di:
  Mi -- se -- re -- re
  no -- bis, mi -- "se -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    c'4.^\tutti g8 e c r e
    a, a r c f f r d
    h c g[ a] g4 r
    R1*2
  }
}

BassoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta, pec --
  ca -- ta mun -- di:
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c'8-\tutti e16 d c8 g e c r e
    a, a r c f, f r d'
    h c g a g4 r
    \clef tenor gis'8-\solo-\aTre gis gis gis a a a a
    b b a a g4. f!8
  }
}

BassFigures = \figuremode {
  r2.. <_+>8
  r1
  r4. <6\\>8 r2
  r2 r8 <6> <\t _+>4
  <5> <6\\ 4>8 <\t 3> <_->4. <3>8
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "cor" "1, 2" }
        \partCombine #'(0 . 10) \CornoI \CornoII
      >>
    >>
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
