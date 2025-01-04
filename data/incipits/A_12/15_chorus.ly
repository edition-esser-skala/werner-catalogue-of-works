\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    d'4 r es r8 es
    d d es f e4 e~
    e8 d d4 r8 d4 d8
    g g f! f f es4 d8
    cis4. d16 e d8 d4 c8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    b'4 r c r8 c
    b a g b b( a) a g
    g( fis) fis4 r8 h4 d8
    c c d d d c4 d8
    e4. e8 a,2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d'4^\tutti r es r8 es
    d d c b b[ a] a g
    g[ fis] fis4 r8 h4 h8
    c c d d d c es d
    cis4. d16[ e] d8 d4 c8
  }
}

SopranoLyrics = \lyricmode {
  Seht! ſeht! ſo
  pfle -- get Gott zu ſtih -- len, zu
  ſtih -- len, dan nach
  ſei -- nen Worth und Wil -- len wird diß
  Rund der Weld, wird diß
}

Alto = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d4^\tutti r c r8 c
    b d g f e2~
    e8[ d] d4 r8 d4 d8
    es! es f! f f es c b!
    a4. h16[ cis] d4 r
  }
}

AltoLyrics = \lyricmode {
  Seht! ſeht! ſo
  pfle -- get Gott zu ſtih --
  len, dan nach
  ſei -- nen Worth und Wil -- len wird diß
  Rund der Weld,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    b4^\tutti r a r8 a
    b a g d' e4 cis
    a2 r8 g4 g8
    g g d' d g,4 g
    r8 e'4 e8 a,4. a8
  }
}

TenoreLyrics = \lyricmode {
  Seht! ſeht! ſo
  pfle -- get Gott zu ſtih -- _
  len, dan nach
  ſei -- nen Worth und Wil -- len
  wird diß Rund der
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    g'4^\tutti r fis r8 \hA fis
    g f es d cis2
    d r8 g4 g8
    es! es h h c4 c
    r8 a'4 g8 fis4. fis8
  }
}

BassoLyrics = \lyricmode {
  Seht! ſeht! ſo
  pfle -- get Gott zu ſtih --
  len, dan nach
  ſei -- nen Worth und Wil -- len
  wird diß Rund der
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    g'4-\tutti r fis r8 \hA fis
    g f es d cis2
    d r8 g4 g8
    es! es h h c4 c
    r8 a'4 g8 fis4. fis8
  }
}

BassFigures = \figuremode {
  r2 <7- 5>
  r8 <6> q q <7> \bassFigureExtendersOn <6> <6\!> <5> \bassFigureExtendersOff
  <9 4> <8 _+> r4. <_!>
  <6>4 <5> <9 4>8 <8 _->4.
  r8 <_+>4 <6!>8 <6>4. <5>8
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
        \set Staff.instrumentName = "T 1"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T 2"
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
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
