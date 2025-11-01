\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Andante"
    R1*6
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Andante"
    R1*6
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    r2 r8 e'^\solo e e
    e4 e, r8 a gis a16[ h]
    a4 h8 a16[ gis] a4 r8 a
    h16[ c a h] c[ h c d] e8. d16 c8 g
    a g16[ a] f4 e r
    R1
  }
}

SopranoLyrics = \lyricmode {
  Be -- a -- ti
  o -- mnes qui ti -- ment
  Do -- _ mi -- num, qui
  am -- _ _ bu -- lant in
  vi -- is e -- ius.
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*5
    r8 g'^\solo g e a8. a16 g8 f
  }
}

AltoLyrics = \lyricmode {
  La -- bo -- res ma -- nu -- um "tu -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*4
    r8 c^\solo c h e8. e16 d8 c
    h16[ c d h] c4. h16[ a] h4\trill
  }
}

TenoreLyrics = \lyricmode {
  La -- bo -- res ma -- nu -- um tu --
  a -- _ _ \hy
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*6
  }
}

BassoLyrics = \lyricmode {
  %tacet
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Andante"
    a8-\solo a'16 h c8 h16 a gis8 fis e d
    c16 a a' h c8 h16 a gis8 fis e d
    c f d e a, a'16 h c8 h16 a
    g!8 f e d c c' a e
    f e d g c, c' h a
    g g, e' a f, f' e d
  }
}

BassFigures = \figuremode {
  r1
  r
  r4 <6 5>8 <_+> r2
  r1
  r4 <7>8 q r2
  r4 <6>2.
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
