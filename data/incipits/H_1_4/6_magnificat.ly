\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/2 \tempoMarkup "[no tempo]"
    R1.*3
    r2 r r4 a''8 a
    g4 f e d c a'8 a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/2 \tempoMarkup "[no tempo]"
    R1.*3
    r2 r r4 c'8 c
    c4 d e f g f8 e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.
    r2 r4 c'^\solo d d
    e f8 f f4 e f e8 d
    c4 d c2 c4 c8^\tutti c
    c4 d e f g f8 e
  }
}

SopranoLyrics = \lyricmode {
  Qui -- a re -- %2
  spe -- xit hu -- mi -- li -- ta -- tem an --
  cil -- lae su -- ae. Qui -- a
  fe -- cit mi -- hi ma -- gna, qui
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 f^\solo g a8 b a4 g8 f
    g4 a8 b a4 g f4. f8
    e4 r r2 r
    f4^\tutti f f e f f8 f
    g4 f e d c c8 a'
  }
}

AltoLyrics = \lyricmode {
  Ma -- gni -- fi -- cat a -- ni -- ma,
  a -- ni -- ma me -- a Do -- mi --
  num,
  Et mi -- se -- ri -- cor -- di -- a
  e -- ius a pro -- ge -- ni -- e
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    r2 r4 c^\solo c c
    c c c c8 c c4 h
    c c d c b8[ d] c[ b]
    a4 b g2 a4 a^\tutti
    g8 g a h c4 \hA h8[ a] g4 a
  }
}

TenoreLyrics = \lyricmode {
  et ex -- ul --
  ta -- vit spi -- ri -- tus me -- _
  us in De -- o sa -- lu --
  ta -- ri me -- o. De --
  po -- su -- it po -- ten -- _ tes, "po -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.
    e4^\solo c f e8 e d4 g
    c, a8 a b! b c c d4 e
    f b, c2 f4 f^\tutti
    e d c8 c d d e4 f8 f
  }
}

BassoLyrics = \lyricmode {
  Ec -- ce e -- nim ex hoc be --
  a -- tam me di -- cent o -- mnes ge -- ne --
  ra -- ti -- o -- nes. Fe --
  cit po -- ten -- ti -- am in bra -- chi -- o
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \tempoMarkup "[no tempo]"
    f4-\solo a e c f a
    e c f e d g
    c, a b! c d e
    f b, c c, f f'-\tutti
    e d c d e f
  }
}

BassFigures = \figuremode {
  r1.
  r1 <7>4 <_!>
  r <6>2. q4 q
  r2 <4>4 <3>2.
  r4 <6!>2. r2
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
