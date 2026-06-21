\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/2 \tempoMarkup "Moderato"
    R1.*6
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/2 \tempoMarkup "Moderato"
    R1.*6
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 3/2 \autoBeamOff \tempoMarkup "Moderato"
    b'1^\solo f'2
    d a b4 f
    f es d2.\trill d4
    c2 r r
    R1.*2
  }
}

SopranoLyrics = \lyricmode {
  Con -- fi --
  te -- bor ti -- _
  bi, _ Do -- mi --
  ne,
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 3/2 \autoBeamOff \tempoMarkup "Moderato"
    R1.*3
    f2^\solo c a'
    a4 b8[ a] g2 f
    f4 e e2 r
  }
}

AltoLyrics = \lyricmode {
  in to -- to
  cor -- _ _ de
  me -- _ o,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 3/2 \autoBeamOff \tempoMarkup "Moderato"
    R1.*2
    c2^\solo f, b
    b4 a a2 c~
    c4 d8[ c] b2 a
    a4 g g2 r
  }
}

TenoreLyrics = \lyricmode {
  in to -- to
  cor -- _ de, cor --
  _ _ de
  me -- _ o,
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 3/2 \autoBeamOff \tempoMarkup "Moderato"
    R1.*5
    r2 c'^\solo c,
  }
}

BassoLyrics = \lyricmode {
  in "con -"
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 3/2 \tempoMarkup "Moderato"
    b4-\solo c d2 a
    b f' d
    a b1
    f2 f' f,
    b1 d2
    c2. d4 e c
  }
}

BassFigures = \figuremode {
  r1.
  r1 <6>2
  r <9> <8>
  r1.
  <9 7>2 <8 6> <3 5>
  <4 6> <_! 5>1
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
