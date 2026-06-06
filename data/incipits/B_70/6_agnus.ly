\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    d'4. d8 es4. es8
    f2. es8 es
    fis fis fis4\trill g8(\pp d) es( c)
    c( h) h4 r2
    R1*2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    g'2~ g8 g g4
    as as g4. g8
    a a a4 d,8(\pp h') c( es,)
    es( d) d4 r2
    R1*2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d'4.^\tutti d8 es4 es8 es
    f2. es8 es
    fis fis fis4 g r
    r2^\aTre r8 b,[^\solo es] g,
    f4 b as4. as8
    g c4 c8 b c d \tuplet 3/2 8 { es16[ d c] }
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec --
  ca -- ta mun -- di:
  Mi -- se --
  re -- re, mi -- se --
  re -- _ re, mi -- se -- re -- re
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    g'2~^\tutti g8 g g4
    as as g g8 g
    a a a4 d, r
    r2^\aTre g4.^\solo es8
    es[ d] e4 f8 c f4~
    f8[ es] fis4 g2
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De --
  i, qui tol -- lis pec --
  ca -- ta mun -- di:
  Mi -- se --
  re -- re, mi -- se -- re --
  re "no -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    b2^\tutti h4 c
    d c8 c h h c4
    c8 a! c4 h r
    r2^\aTre es,4.^\solo es8
    b'4 g f4. f8
    c'4 a g8 es' b c
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus __ _
  De -- i, qui tol -- lis pec --
  ca -- ta mun -- di:
  Mi -- se --
  re -- re, mi -- se --
  re -- re, mi -- se -- re -- re
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    g'2^\tutti g
    f g4 g
    g2 g4 r
    R1*3
  }
}

BassoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui
  tol -- lis
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    g'2~-\tutti g
    f g~
    g g4 r
    \clef tenor r2^\aTre es4.-\solo  es8
    b'4 g f4. f8
    c'4 a g8 es' b c
  }
}

BassFigures = \figuremode {
  r2 <6- _!>4 <\t 4>
  <8 6 _-> <\t 5 \t> <7 _!> <6- 4>
  <7 4\+ 2>2 <8 _!>
  r1
  <4>8 <3> <6!>4 <_->2
  <4>8 <_-> <6\\>4. <6>8 q4
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
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
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
