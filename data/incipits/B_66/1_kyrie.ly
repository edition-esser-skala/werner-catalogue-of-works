\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Alla capella"
    R1*10
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "Alla capella"
    R1*4
    a2. a4
    h? e, e'2~
    e4 d2 c4
    h a2 gis4
    a2. g4~
    g f e a
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Alla capella"
    R1*10
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Alla capella"
    R1*10
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "Alla capella" \autoBeamOff
    R1*10
  }
}

SopranoLyrics = \lyricmode {
  %tacet
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Alla capella" \autoBeamOff
    R1*10
  }
}

AltoLyrics = \lyricmode {
  %tacet
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "Alla capella" \autoBeamOff
    R1*4
    a2. a4
    h? e, e'2~
    e4 d2 c4
    h a2 gis4
    a2. g4
    g f e a
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri --
  e __ _ e --
  _ _
  lei -- _ _
  son, e --
  lei -- _ _ \hy
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Alla capella" \autoBeamOff
    d2. d4
    e a, a'2~
    a4 g2 f4
    e d2 cis4
    d8[ e f g] a4 a,
    e'2. c!4
    f2 e
    d4 c h e
    a,8[ h c d] e2
    cis4 d2 \hA cis4
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri --
  e __ _ e --
  _ _
  lei -- _ _
  son, __ _ e --
  lei -- _
  son, e --
  lei -- _ _ _
  son, __ _
  e -- lei -- \hy
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Alla capella"
    d2.-! d4-!
    e-! a,-! a'2~-!
    a4 g2-! f4-!
    e-! d2-! cis4-!
    d8 e f g a4 a,
    e'2. c!4
    f2 e
    d4 c h? e
    a,8 h? c d e2
    cis4 d2 \hA cis4
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r2 <_!>
  <_+>1
  <7>4 <6> <7> <6>
  <6> <6> <7> <_+>
  r2 <4>4 <_!>
  <5> <3> <2> <6>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        % \set GrandStaff.instrumentName = "trb"
        % \new Staff {
        %   \set Staff.instrumentName = "1"
        %   \TromboneI
        % }
        \new Staff {
          \set Staff.instrumentName = "trb 2"
          \TromboneII
        }
      >>
    >>
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
