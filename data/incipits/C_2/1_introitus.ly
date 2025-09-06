\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    R1 \bar "||"
    \time 4/4 r2 a'~
    a4 g a2
    r4 cis, d2
    e4 f e2
    e r
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    R1 \bar "||"
    \time 4/4 R1
    r2 a~
    a4 g a h
    c h8 h h2\trill
    a r4 a
  }
}

ViolinoI = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    R1 \bar "||"
    \time 4/4 R1 \noBreak
    d'4. d8 cis4 d
    b2 a4 gis
    a2. gis4
    a8 c!4 d8 es4 d8 c
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    R1 \bar "||"
    \time 4/4 r2 a'~
    a4 g a2
    r4 cis, d2
    e4 f e2
    e r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
      \once \omit Staff.TimeSignature
    R1 \bar "||"
    \time 4/4 R1 \noBreak
    d'4.^\tutti d8 cis4 d
    b2 a4 gis
    a2. gis4
    a8 c!4 d8 es4 d8([ c)]
  }
}

SopranoLyrics = \lyricmode {
  Re -- qui -- em ae --
  ter -- nam, ae --
  ter -- _
  nam do -- na e -- is,
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
      \once \omit Staff.TimeSignature
    R1 \bar "||"
    \time 4/4 r2 a'~
    a4 g a2
    r4 cis, d2
    e4 f e2
    e r
  }
}

AltoLyrics = \lyricmode {
  Re --
  qui -- em
  ae -- ter --
  nam, ae -- ter --
  nam
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
      \once \omit Staff.TimeSignature
    R1 \bar "||"
    \time 4/4 R1
    r2 a~
    a4 g a h
    c h8 h h2
    a r4 a
  }
}

TenoreLyrics = \lyricmode {
  Re -- %3
  qui -- em ae --
  ter -- nam, ae -- ter --
  nam "do -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
      \once \omit Staff.TimeSignature
    d\breve*1/8 e d d \bar "||"
    \time 4/4 d4.^\tutti d8 cis4 d
    b2 a4 fis'
    g2 f4 e8[ d]
    c!4 d e2
    a, r
  }
}

BassoLyrics = \lyricmode {
  Re -- _ qui -- em.
  Re -- qui -- em ae --
  ter -- nam, ae --
  ter -- nam, ae --
  ter -- _ _
  nam
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    d\breve*1/8 e d d \bar "||"
    \time 4/4 d2-\tutti cis4 d
    b2 a4 fis'
    g2 f4 e8 d
    c!4 d e2
    a,4 a' g! fis
  }
}

BassFigures = \figuremode {
  r1
  r
  <7>4 <6> <_+> <6>
  <3- 2> <4\+ 1> <6> <_+>
  <6> <6! 5> <5 4> <\t _+>
  r2 <6->4 <6>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "trb"
        \new Staff {
          \set Staff.instrumentName = "1"
          \TromboneI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
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
        % \transpose c c,
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
