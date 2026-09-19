\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Largo"
    a'4 fis' e2~
    e8 d d4 c2
    h8 h h h a a a a
    h h h h e, e e e
    e' e, e e e( dis) dis4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Largo"
    fis4 a2 cis8 e
    a,4 r fis a8( g)
    g g g g fis fis fis fis
    gis gis gis gis gis( a) a a
    ais ais ais ais h fis fis fis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*5
  }
}

SopranoLyrics = \lyricmode {
  %tacet
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*5
  }
}

AltoLyrics = \lyricmode {
  %tacet
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    d4^\solo a e'8[ cis] a g
    g[ fis] fis g a a c[ h]
    g4 r r2
    R1*2
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di:
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    R1*2
    e4.^\solo e8 e[ dis] dis4
    d4. d8 d[ c] c4
    cis2 h
  }
}

BassoLyrics = \lyricmode {
  Mi -- se -- re -- re,
  mi -- se -- re -- re
  no -- bis.
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Largo"
    d4.-\solo d8 cis2
    d dis
    e8 e e e e dis dis dis
    d d d d d c c c
    cis cis cis cis h h h h
  }
}

BassFigures = \figuremode {
  r2 <#(dotbf 6)>4. <5>8
  <9 4>4 <8 _+> <7! 5>2
  r2 <4 2>8 <5 3>4.
  <6 4\+>2 <\t \t>8 <6>4.
  <6\\>2 <4>8 <_+>4.
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
