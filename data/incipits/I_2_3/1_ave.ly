\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/2 \tempoMarkup "Alla capella"
    f2 g4 b b a
    d2 c4 f2 e4
    d2 c r4 b~
    b a h c4. c8 b4
    a4. a8 h4 c2 \hA h4
    c2 r r
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key f \major \time 3/2 \tempoMarkup "Alla capella"
    r4 c d g c, f
    d4. e8 f g a4 b g
    f g e f2 e4
    f2 r r
    r r r4 f~
    f e fis g4. g8 f4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/2 \tempoMarkup "Alla capella" \autoBeamOff
    f2 g4 b b a
    d2 c4 f2 e4
    d2 c r4 b~
    b a h c4. c8 b4
    a4. a8 h4 c2 \hA h4
    c2 r r
  }
}

SopranoLyrics = \lyricmode {
  A -- ve Re -- gi -- na
  coe -- lo -- _ _
  _ rum, a --
  ve Do -- _ mi -- na
  An -- ge -- lo -- _ _
  rum,
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 3/2 \tempoMarkup "Alla capella" \autoBeamOff
    r4 c d g c, f
    d4. e8 f[ g] a4 b g
    f g e f2 e4
    f2 r r
    r r r4 f~
    f e fis g4. g8 f4
  }
}

AltoLyrics = \lyricmode {
  A -- ve Re -- gi -- na
  coe -- _ lo -- _ rum, Re --
  gi -- na coe -- lo -- _
  rum,
  a --
  ve Do -- _ mi -- na
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 3/2 \tempoMarkup "Alla capella" \autoBeamOff
    a2 b4 g g f
    r2 r4 c' b c
    d g,2 a4 b2
    c r r
    R1.
    r4 c2 h4 cis d
  }
}

TenoreLyrics = \lyricmode {
  A -- ve Re -- gi -- na
  coe -- lo -- _
  rum, coe -- _ lo --
  rum,

  a -- ve Do -- \hy
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \tempoMarkup "Alla capella" \autoBeamOff
    f4 f2 e4 f2
    b,4 b'2 a4 g c~
    c b2 a4 g2
    f4 f2 e4 fis g~
    g8 g f4 f e d2
    c r r
  }
}

BassoLyrics = \lyricmode {
  A -- ve Re -- gi --
  na coe -- _ lo -- _
  _ _ _
  rum, a -- ve Do -- _
  mi -- na An -- ge -- lo --
  rum,
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \tempoMarkup "Alla capella"
    f,4 f'2 e4 f2
    b,4 b'2 a4 g c~
    c b2 a4 g2
    f4 f2 e4 fis g~
    g8 g f2 e4 d2
    c4 \clef alto << {
      e' fis g2 f4
    } \\ {
      c2 h4 cis d
    } >>
  }
}

BassFigures = \figuremode {
  r4 <3> <4 2> <5> <9 4> <8 3>
  r <3> <5 2> <6> <7> <3>
  <2> <6> <2> <6> <7> <6>
  <4> <3> <4! 2> <6> <5> <_->
  <2> <3> <4!> <6> <7> <6!>
  <4>1.
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
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
