\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Passato"
    R1*4
    r2 r4 r16 e'\p g e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Passato"
    R1*5
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Passato"
    R1*2
    r4 r8 f^\solo g c c b
    a16 a d8 d c16 c b4. a8
    a8. a16 d8 c c[ h] c4
  }
}

SopranoLyrics = \lyricmode {
  et ex -- ul -- ta -- vit
  spi -- ri -- tus me -- us in De -- o
  sa -- lu -- ta -- ri me -- o.
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Passato"
    R1*2
    r2 r8 c^\solo d g
    g f e16 e a8 a g4 f8
    f16 d f8. f16 e e d4 e
  }
}

AltoLyrics = \lyricmode {
  et ex -- ul --
  ta -- vit spi -- ri -- tus me -- us in
  De -- o sa -- lu -- ta -- ri me -- o.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Passato"
    f,4^\solo g8. a16 b8 b8. b16 a8
    g c4 b8 a d4 c8
    b8. b16 a4 r2
    R1*2
  }
}

TenoreLyrics = \lyricmode {
  Ma -- gni -- fi -- cat a -- ni -- ma
  me -- _ a Do -- _ _
  _ mi -- num,
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Passato"
    r4 c^\solo d8. e16 f8 f~
    f16 f e8 fis g4 f8 e[ a]~
    a[ g] f8. f16 e4 r
    R1
    r2 g8 h16 g e8 c16 c'
  }
}

BassoLyrics = \lyricmode {
  Ma -- gni -- fi -- cat a --
  ni -- ma me -- _ a Do --
  _ mi -- num,

  Qui -- a re -- spe -- xit "hu -"
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Passato"
    f8-\solo a e c d8. e16 f8 f,
    c'4 a8 g d'4 a
    d8 e f f, c'4 g
    d' a d8 e f4
    d8 d h c g' g, c4
  }
}

BassFigures = \figuremode {
  r4. <6>8 q4 <4>8 <3>
  <4> <3> <6\\>4 <4>8 <3> <4> <3>
  <6 5> <5> r2 <4>8 <3>
  <4> <3> <4> <3> <6 5> <5> <9> <8>
  r4 <6 5> <4>8 <3>4.
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
