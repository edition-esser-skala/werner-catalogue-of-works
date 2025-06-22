\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 4/4 \tempoMarkup "Andante"
    R1*4
    r8 d'4 cis8 d16 fis g a d,4~
    d8 c16 h c h c8 fis,8. fis16 h8 h,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 4/4 \tempoMarkup "Andante"
    R1*4
    r8 a'4 e8 fis8. fis16 g d d a'
    h8. h16 a8 g fis16 h, dis fis g8 fis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    h'2^\solo h4. cis16 dis
    e8 d16 c h8. a16 g8. fis16 e8 e'
    d! a16[ h] c[ h] c8 h c16 d e8[ g,]
    fis a g c h16[ c] d8 g,4~
    g8 fis16[ g] e4\trill d r
    R1
  }
}

SopranoLyrics = \lyricmode {
  Ma -- gni -- fi -- cat
  a -- ni -- ma me -- a Do -- mi -- num, et
  ex -- ul -- ta -- vit spi -- ri -- tus me --
  us in De -- o sa -- lu -- ta --
  ri me -- o.
}

Alto = {
  \relative c' {
    \clef alto
    \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*6
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*6
  }
}

Basso = {
  \relative c {
    \clef bass
    \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*4
    r8 d^\solo a'8. g16 fis8 e16 d g8 a
    h a16 g fis8 e dis h e fis
  }
}

BassoLyrics = \lyricmode {
  Qui -- a re -- spe -- xit hu -- mi -- li --
  ta -- tem an -- cil -- lae su -- ae. Ec -- ce
}

Organo = {
  \relative c {
    \clef bass
    \key e \minor \time 4/4 \tempoMarkup "Andante"
    e8-\solo fis g fis16 e dis8 cis h a
    g e' dis h e fis g fis16 e
    fis4 e8 fis g g, c e
    d c h a << { g' fis e d } \\ { g,4 } >>
    cis8 d a' a, d d' h fis
    g g, a4 h8 h'16 a g8 dis
  }
}

BassFigures = \figuremode {
  r1
  <6>8 q q2 q4
  <6> <6>8 <\t> r2
  r8 <6> q2.
  <6>4 <4>8 <_+>4. <6>4
  r4 <6\\>8 <5> <_+>4 <6>4
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

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }

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
