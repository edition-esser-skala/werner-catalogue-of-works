\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Adagio"
    R1*6
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Adagio"
    R1*6
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d'2.^\solo c4
    c8[ b] b b a[ c] b a
    b16[ c] d4 es8 f4 f~
    f8 f es4 des8 des des[ c]
    as4 r r2
    d4. d8 es!4 c8 f
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui tol -- lis pec --
  ca -- ta, pec -- ca -- ta, __
  pec -- ca -- _ ta mun --
  di:
  A -- gnus De -- i, qui
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r2 e4^\solo es
    d8.[ es16] f8 g c,8.[ d32 es] d8 c
    d16[ es] f4 g8 as2
    g4. g8 g4. e8
    c4 r r2
    R1
  }
}

AltoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui tol -- lis pec --
  ca -- ta, pec -- ca --
  _ ta mun -- _
  di:
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*4
    r4 a!8^\solo a a4 b
    a2 g4 r
  }
}

TenoreLyrics = \lyricmode {
  Mi -- se -- re -- re
  no -- bis.
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*3
    r2 r4 e8^\solo e
    f2 fis4 g~
    g fis g r
  }
}

BassoLyrics = \lyricmode {
  Mi -- se --
  re -- re no --
  _ bis.
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Adagio"
    b8-\solo b' f g a4 fis
    g8 g, d' es f4 f,
    b8 b' as g f es d c
    h4 c e2
    f4 es d cis
    d2 g,4 a
  }
}

BassFigures = \figuremode {
  r4 <6> <5! 4> <7- 5>
  <4>8 <3> <6>2 <6 4>8 <5 3>
  r4 <\t>8 <6> <_->4. \once \bassFigureExtendersOn q8
  <5>4 <_-> <7- 5>2
  <_->4 <4!> <_+> <7 5>
  <4> <_+> <6-> <6>
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
