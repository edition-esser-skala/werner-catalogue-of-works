\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/2 \tempoMarkup "Allegro"
    f' f, r2 f4 a
    c e g2 c,4 e
    f a c2 f,,4 a
    c e g e, c e
    f c' f2 a4 c
    b, d f f, b d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/2 \tempoMarkup "Allegro"
    f' f, r2 f4 a
    c e g2 c,4 e
    f a c2 f,,4 a
    c e g e, c e
    f c' f2 a4 c
    b, d f f, b d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro"
    c'1^\tutti c2
    c2. c4 c2
    c2. c4 f2
    e1 e2
    f f f,
    d'1 d2
  }
}

SopranoLyrics = \lyricmode {
  Di -- xit
  Do -- mi -- nus
  Do -- mi -- no
  me -- o:
  Se -- de a
  dex -- tris,
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro"
    a'1^\tutti a2
    g2. g4 g2
    a2. a4 a2
    g1 g2
    r c, a'
    \grace g8 f1 f2
  }
}

AltoLyrics = \lyricmode {
  Di -- xit
  Do -- mi -- nus
  Do -- mi -- no
  me -- o:
  Se -- de,
  se -- de,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro"
    c1^\tutti c2
    e2. e4 e2
    f2. f4 c2
    c1 c2
    r r c~
    c b4 a b2
  }
}

TenoreLyrics = \lyricmode {
  Di -- xit
  Do -- mi -- nus
  Do -- mi -- no
  me -- o:
  Se --
  _ _ de,
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro"
    f1^\tutti f2
    c'2. c4 c2
    f,2. f4 f2
    c1 c2
    r a'2. a4
    b1 b,2
  }
}

BassoLyrics = \lyricmode {
  Di -- xit
  Do -- mi -- nus
  Do -- mi -- no
  me -- o:
  Se -- de,
  se -- de
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 3/2 \tempoMarkup "Allegro"
    r4 f,-\tutti f' c a f
    r c' c' g e c
    r f f' c a f
    r c c' g e c
    r a a' f c a
    r b b' f d b
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  r
  r4 <6> r1
  r1.
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
