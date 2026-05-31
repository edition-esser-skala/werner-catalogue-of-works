\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Allegretto"
    r1
    r2 g'4 c~
    c8 h e, fis g4. a8
    d,4 r d'4. c8~
    c h16 a \hA h4 c f~
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Allegretto"
    c4 f4. e8 a, h
    c8. d32 e f4. e16 d e8 fis
    g4 r r2
    r4 g4. f!4 e8
    d2 e4 a~
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegretto"
    r1
    r2 g'4^\tutti c~
    c8[ h e, fis] g4. a8
    d,4 r d'4. c8~
    c[ h16 a] \hA h4 c f
  }
}

SopranoLyrics = \lyricmode {
  San -- _
  _ _
  ctus, san -- _
  _ ctus, "san -"
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegretto"
    c4^\tutti f4. e8[ a, h]
    c8.[ d32 e] f4. e16[ d] e8[ fis]
    g4 r r2
    r4 g4. f!4 e8
    d2 e4 a
  }
}

AltoLyrics = \lyricmode {
  San -- _ _
  _ _ _ _
  ctus,
  san -- _ _
  ctus, san \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegretto"
    R1*2
    g4^\tutti c4. h8[ e, fis]
    g8.[ a16] h8[ c] d4 g,
    g2 g4 r
  }
}

TenoreLyrics = \lyricmode {
  San -- _ _
  _ _ _ ctus,
  san -- ctus,
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegretto"
    r2 c4^\tutti f~
    f8[ e a, h] c4. a8
    g4 a g c~
    c8[ h g a] \hA h4 c
    g'2 c,4 r
  }
}

BassoLyrics = \lyricmode {
  San -- _
  _ ctus,
  san -- ctus, san -- _
  _ ctus,
  san -- ctus,
}

Organo = {
  \relative c {
    \clef alto
    \key f \major \time 4/4 \tempoMarkup "Allegretto"
    c'4-!-\tutti f-! \clef bass c, f~
    f8 e a, h c4. a8
    g4 a g c~
    c8 h g a \hA h4 c
    g2 c4 \clef soprano << { f'' } \\ { a, } >>
  }
}

BassFigures = \figuremode {
  r2 <4>8 <3> <3> <4!>
  <5> <\t> <6> <\t> <4>4 <3>8 <6\\>
  <8 4> <\t _!> <5> <6\\> <4> <_!> <3> <4\+>
  <5 2> r4. <6>8 <5> <9 4> <8 3>
  <4>4 <_!>2.
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
