\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    \pa e'2 f g
    a2. h2 h4
    c2 \pd r r
    \pa g2 a4 fis g2~
    g4 g g2 fis
    g1 \pd r2
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    c'4 e d2 c~
    c4 f2 e8 f d4 g~
    g e r2 r
    c4 e d c d2
    e4 e d2. d4
    d1 r2
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    c4 c8 c c4 g c2
    r r4 g8 g g4 g
    c c r2 r
    R1.*3
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    c'2. h4 c4. c8
    a4 d2 c8 d h4 g
    c2 a4 d h2
    c4 e d c h2~
    h4 c a1\trill
    h r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    e2 f g4. g8
    c,4 f2 e8 f d4 g~
    g e r a f d
    g2 a4 fis g2
    g4 g2 fis8 e \hA fis2\trill
    g1 r2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    c'2.^\tutti h4 c4. c8
    a4 d2 c8 d h4 g
    c2 a4 d h2
    c4 e d c h2~
    h4 c a1
    h2 d^\solo d
  }
}

SopranoLyrics = \lyricmode {
  Di -- xit Do -- mi --
  nus Do -- mi -- no me -- o:
  Se -- de a dex --
  tris, a dex -- tris, dex --
  tris me --
  is, do -- nec
  po -- nam in -- i --
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    e2^\tutti f g4. g8
    c,4 f2 e8 f d4 g~
    g e r a f d
    g2 a4 fis g2
    g4 g2 fis8[ e] \hA fis2
    g r r
  }
}

AltoLyrics = \lyricmode {
  Di -- xit Do -- mi --
  nus Do -- mi -- no me -- _
  o: Se -- de a
  dex -- tris, a dex --
  tris me -- _ _
  is,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    g4^\tutti c a d c2~
    c4 a8 a a4 h2 d8 d
    g,4 g r2 d'
    e4 c a2 h4 d
    e e d1
    d r2
  }
}

TenoreLyrics = \lyricmode {
  Di -- _ xit _ Do --
  mi -- nus Do -- _ mi -- no
  me -- o: Se --
  de a dex -- tris, a
  dex -- tris me --
  is,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    c2^\tutti d e
    f4. f8 d4 g2 f8 g
    e4 c f2 d4 g
    e2 fis4 a g \hA fis
    e d8[ c] d1
    g, r2
  }
}

BassoLyrics = \lyricmode {
  Di -- _ xit
  Do -- mi -- nus Do -- mi -- no
  me -- o: Se -- de a
  dex -- tris, a dex -- tris
  me -- _ _
  is,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "[no tempo]"
    c2-\tutti d e
    f d4 g2 f8 g
    e4 c f2 d4 g
    e2 fis4 a g \hA fis
    e c d1
    g1-\solo fis2
  }
}

BassFigures = \figuremode {
  r2 <7>4 <6> q2
  <5>4 <6> r1
  <6>2 <5>4 <6> q2
  q q1
  <5>2 <4> <_+>
  r1.
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { \transposedNameShort "clno" "C" "" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = \transposedTimpShort "C" "" "G" ""
      \Timpani
    }
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
