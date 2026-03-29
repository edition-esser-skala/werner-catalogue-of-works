\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \dorian \time 3/4 \tempoMarkup "[no tempo]"
    a''2 a4
    a a f
    f f a
    d, b f'~
    f g c
    a d, d
    d2 d4
    g2 c,4~
    c c2
    c r4
  }
}

ViolinoII = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 3/4 \tempoMarkup "[no tempo]"
    d'2 d4
    c c b
    a a a
    b2 a4~
    a g2
    fis r4
    r b b
    b2 a4~
    a g2
    a4 r r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    d'2 d4
    c c b
    a a a
    b2 a4~
    a g2
    fis r4
    r b b
    b2 a4~
    a g2
    a4 c a
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui
  tol -- lis pec --
  ca -- ta __
  mun --
  di:
  Mi -- se --
  re -- re __
  no --
  bis. A -- gnus
}

Alto = {
  \relative c' {
    \clef alto
    \key d \dorian \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    f2 f4
    e e d8[ e]
    f4 f d
    d es2
    d4 d c
    d fis fis
    g2.~
    g2 f4~
    f f e
    f f f
  }
}

AltoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui
  tol -- lis pec --
  ca -- _
  ta mun -- _
  di: Mi -- se --
  re --
  re __
  no -- _
  bis. A -- gnus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \dorian \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    a2 a4
    c c d
    c c a
    g2 a4~
    a b c
    a a a
    b2 d4
    c2.~
    c
    c4 a f
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus
  De -- i, qui
  tol -- lis pec --
  ca -- ta __
  mun -- _
  di: Mi -- se --
  re -- re
  no --

  bis. A -- gnus
}

Basso = {
  \relative c {
    \clef bass
    \key d \dorian \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 d d
    a' a b
    f f fis
    g2 f4~
    f es2
    d r4
    g2 f4
    e!2 f4~
    f c2
    f,4 r r
  }
}

BassoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui
  tol -- lis pec --
  ca -- ta __
  mun --
  di:
  Mi -- se --
  re -- re __
  no --
  bis.
}

Organo = {
  \relative c {
    \clef bass
    \key d \dorian \time 3/4 \tempoMarkup "[no tempo]"
    d2 d4
    a'2 b4
    f2 fis4
    g2 f4~
    f es2
    d d4
    g2 f4
    e!2 f4~
    f c2
    f,4 \clef tenor a' f
  }
}

BassFigures = \figuremode {
  r2.
  r
  r2 <6>4
  <5 _-> <6- \t> <7>
  <6> <7> <6>
  <_+>2.
  <_->
  <6 5->
  r4 <4> <3>
  r <6>2
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
