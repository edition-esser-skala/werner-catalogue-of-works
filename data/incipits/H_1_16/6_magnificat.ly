\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Andante"
    R1*3
    r2 d16 d32 d d16 d fis fis a a
    d h8 d16 a d8 g,16 fis d'8 d16 g, e'8 e16
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Andante"
    R1*3
    r2 d16 d32 d d16 d fis fis a a
    d h8 d16 a d8 g,16 fis d'8 d16 h e8 e16
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r8 g'^\solo d' e16 fis g8 fis16 e d8.\trill c16
    h a g8 r4 r8 d' d16[ cis] g'8
    fis d r4 r2
    r d,8^\tutti d fis a16 a
    d8 d d d16 d d8 d h16 h e e
  }
}

SopranoLyrics = \lyricmode {
  Ma -- gni -- fi -- cat a -- ni -- ma me -- a
  Do -- mi -- num, Qui -- a re --
  spe -- xit
  Ec -- ce e -- nim ex
  hoc be -- a -- tam me di -- cent o -- mnes ge -- "ne -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r2 r8 g'^\solo g fis
    g16[ a] h[ c] a8 fis16 a d,8 d r4
    R1
    r8 e a g fis fis r4
    r8 g^\tutti a g16 g fis8 g g16 g g g
  }
}

AltoLyrics = \lyricmode {
  et ex -- ul --
  ta -- vit spi -- ri -- tus me -- us

  an -- cil -- lae su -- ae.
  be -- a -- tam me di -- cent o -- mnes ge -- "ne -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r8 g^\solo d'8. c16 h c d a g4\trill
    a8 d cis c h g r4
    g8 c4 h8 a a r4
    r8 h^\tutti d h16 h a8 h g16 g c c
  }
}

TenoreLyrics = \lyricmode {
  in De -- o sa -- lu -- ta -- ri me --
  o. hu -- mi -- li -- ta -- tem
  an -- cil -- lae su -- ae.
  be -- a -- tam me di -- cent o -- mnes ge -- "ne -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2
    r2 r8 g'8^\solo fis f
    e a16 a fis8 g d d r4
    r8 g^\tutti fis g16 g d8 h e16 e c c
  }
}

BassoLyrics = \lyricmode {
  hu -- mi -- li -- %3
  ta -- tem an -- cil -- lae su -- ae.
  be -- a -- tam me di -- cent o -- mnes ge -- "ne -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Andante"
    g'8-\solo h fis d h c d4
    g,8 g' fis d g fis e4
    d e8 fis g g, a h
    c a' fis g d d r4
    r8 g-\tutti fis g d h e c
  }
}

BassFigures = \figuremode {
  r2. <4>8 <_+>
  r2. <7>8 <6\\>
  r4 <6\\>8 <5!>4. <6\\>8 <5!>
  r4 <5>2.
  r4 r4. <6>
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
