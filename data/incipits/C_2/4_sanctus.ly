\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/4 \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    R4*3 \bar "||"
    \time 4/4 r4 f f( e)
    r g g( f)
    r e d( e)
    f2. e4
    f r r b~
    b g f g
    g2 g4 r
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key d \minor \time 3/4 \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    R4*3 \bar "||"
    \time 4/4 r4 a a( g)
    r b b( a)
    r c( d) b
    c1
    c4 r r2
    r4 c4. d8 e4
    d2 e4 r
  }
}

ViolinoI = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/4 \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    R4*3 \bar "||"
    \time 4/4 r2 r4 c'
    c( b) r d
    d( c) b2~
    b4 a g2
    a4 f'4. f8 d4
    b4. b8 a h c4~
    c h c g
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/4 \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    R4*3 \bar "||"
    \time 4/4 r4 f f( e)
    r g g( f)
    r e d( e)
    f2. e4
    f r r b~
    b8 b g4 f g
    g2 g8 e4 g8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    R4*3 \bar "||"
    \time 4/4 r2 r4 c'
    c b r d
    d c b2
    b4 a g2
    a4 f'4. f8 d4
    b4. b8 a h c4~
    c h c r
  }
}

SopranoLyrics = \lyricmode {
  San -- %2
  ctus, _ san --
  ctus, _ san --
  ctus, _ san --
  ctus Do -- mi -- nus
  De -- us, De -- us Sa --
  ba -- oth.
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    R4*3 \bar "||"
    \time 4/4 r4 f^\tutti f e
    r g g f
    r e d e
    f2. e4
    f r r b~
    b8 b g4 f g
    g4. g8 g4 r
  }
}

AltoLyrics = \lyricmode {
  San -- ctus, _
  san -- ctus, _
  san -- ctus, _
  san -- _
  ctus Do --
  mi -- nus De -- us
  Sa -- ba -- oth.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    R4*3 \bar "||"
    \time 4/4 r4 a^\tutti a g
    r b b a
    r c d b
    c1
    c4 r r2
    r4 c4. d8 e4
    d4. d8 e4 r
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus, _
  san -- ctus, _
  san -- _ ctus,
  san --
  ctus
  Do -- mi -- nus
  Sa -- ba -- oth.
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    d\breve*1/8 d c \bar "||"
    \time 4/4 f2^\tutti c
    g' d
    r4 a' a g
    f2 c
    f, r4 g'~
    g8 g e4 f c
    g4. g8 c c^\solo e g
  }
}

BassoLyrics = \lyricmode {
  San -- ctus. __ _
  San -- ctus,
  san -- ctus,
  san -- ctus, _
  san -- _
  ctus Do --
  mi -- nus De -- us
  Sa -- ba -- oth. Ple -- ni sunt
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \tempoMarkup "Adagio"
      \once \omit Staff.TimeSignature
    d\breve*1/8 d c \bar "||"
    \time 4/4 f2-\tutti c
    g' d
    a'2. g4
    f2 c
    f, r4 g'~
    g8 g e4 f c
    g2 c4. b8-\solo
  }
}

BassFigures = \figuremode {
  r4*3
  r2 <6 4>4 <5 3>
  <4> <3> <6 4> <5 3>
  <4> <3> <4 2-> <6>
  <4> <3> <4> <3>
  r1
  r4 <6 5>2.
  <4>4 <_!>2.
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
