\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/2 \tempoMarkup "[no tempo]"
    c'4 f2 e4 f4. f8
    g4 a d,8 e f4 g a
    f g c,2 r4 g'
    a2~ a8 g g4 g2
    g4 g a2 f4. f8
    g4 g e e r f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/2 \tempoMarkup "[no tempo]"
    a'2 g4 c f, b~
    b a8 g f4 d' c4. c8
    b4. b8 a4 c d e
    f4. e8 d4 e d2\trill
    e r4 e a, d~
    d d g, g r c
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    a'2^\tutti g f4 b~
    b a d4. d8 e4 f
    b,4. b8 a4 c d e
    f4. e8 d4 e d2
    e r4 e f2
    d4. d8 e4 e c c
  }
}

SopranoLyrics = \lyricmode {
  Con -- fi -- te -- _
  bor ti -- bi, ti -- bi,
  Do -- mi -- ne, in to -- to
  cor -- _ _ de me --
  o, in con --
  si -- li -- o iu -- sto -- rum,
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    f2.^\tutti e4 f f
    g f f2 g4 a
    f g c,2 r4 g'
    f a a8[ g] g4 g2
    g4 g a2 f4. f8
    g4 g e e r f
  }
}

AltoLyrics = \lyricmode {
  Con -- fi -- te -- bor
  ti -- bi, Do -- _ _
  _ mi -- ne, in
  to -- to cor -- de me --
  o, in con -- si -- li --
  o iu -- sto -- rum, et
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    c2.^\tutti c4 a d
    c2 r4 b c2
    d4 c c a h c
    d8[ a] d[ c] h4 c2 \hA h4
    c e c2 a4. a8
    b!4 b g g r c
  }
}

TenoreLyrics = \lyricmode {
  Con -- fi -- te -- _
  bor ti -- bi,
  Do -- mi -- ne, in to -- to
  cor -- de me -- _ _
  o, in con -- si -- li --
  o iu -- sto -- rum, et
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    f4.^\tutti f8 c2 d
    e4 f b, b'2 a4
    d, e f2 r4 e
    d f g c, g2
    c r4 c d2
    b!4. b8 c4 c a a
  }
}

BassoLyrics = \lyricmode {
  Con -- fi -- te -- bor
  ti -- bi, ti -- _ bi,
  Do -- mi -- ne, in
  to -- to cor -- de me --
  o, in con --
  si -- li -- o iu -- sto -- rum,
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \tempoMarkup "[no tempo]"
    f2-\tutti c d
    e4 f b, b'2 a4
    d, e f2. e4
    d f g c, g2
    c r4 c d2
    b!4. b8 c4 c a a
  }
}

BassFigures = \figuremode {
  r2 <4>4 <3> <5> <6->
  <6 5>2. <3>4 <2> <6>
  <6-> <\t>2. <6 4!>4 <6>
  r <6> <_!>2 <4>4 <_!>
  r2. <6>
  q1 <5>4 <6>
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
