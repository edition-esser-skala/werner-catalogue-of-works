\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "[no tempo]"
    c'4 a r8 d c b
    a4 h c r
    r8 c d e f2~
    f8 e d4\trill e8 c4 f8
    d8. d16 b4 c8. c16 a4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "[no tempo]"
    c'4 a r8 d c b
    a4 h c r
    r8 c d e f2~
    f8 e d4\trill e8 c4 f8
    d8. d16 b4 c8. c16 a4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    c'4^\tutti a r8 d c b
    a4 h c r
    r8 c d e f2
    f8 e d4 e8 c4 f8
    d8. d16 b4 c8. c16 a4
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- _ tem,
  fa -- cto -- rem coe --
  li et ter -- rae, vi -- si --
  bi -- li -- um o -- mni -- um
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 c^\tutti f r8 d
    f g f4 e8 e f g
    a4. g8 f4 r8 f
    g2 g4 r8 a~
    a f g8. g16 g4 f8. f16
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten -- tem, fa -- cto -- rem
  coe -- _ li et
  ter -- rae, vi --
  si -- bi -- li -- um o -- "mni -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 a^\tutti a r8 b
    c c d4 g, r
    r8 a h c d16[ a \hA h c] d8 c
    h c4 \hA h8 c4 r8 c
    a d4 b8 g c4 a8
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten -- tem,
  fa -- cto -- rem coe -- li et
  ter -- _ _ rae, vi --
  si -- bi -- li -- um o -- "mni -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 f^\tutti d r8 g
    f e d4 c8 c d e
    f4. e8 d4 r8 a'
    g c, g4 c r8 f~
    f b g8. g16 e4 f8. f16
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten -- tem, fa -- cto -- rem
  coe -- _ li, coe --
  li et ter -- rae, vi --
  si -- bi -- li -- um o -- "mni -"
}

Organo = {
  \relative c {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "[no tempo]"
    c''4-!-\tutti \clef bass f,, d r8 g
    f e d4 c8 c d e
    f4. e8 d4 r8 a'
    g c, g4 c r8 f~
    f b g4 e f
  }
}

BassFigures = \figuremode {
  r1
  r4 <6!>4. <3>8 q q
  q4 <4!>8 <6> r2
  <_!>4 <4>8 <_!> r2
  <6>2 q
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
