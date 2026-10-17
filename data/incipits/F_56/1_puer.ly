\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Presto"
    c'2. d8 e
    f4 e8 d c4.\trill b8
    a4 d c4. c8
    c4 c2 d8 e
    f e d c h a g f
    e4 c'2 h4
    c8 c, e g a f' d h
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Presto"
    a'4 g8 f g2
    f4 f2 e4
    f b g4. g8
    a2 g
    f4. e8 d4 d
    c2 d4. d8
    e c e g a f' d h
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    c'2. d8 e
    f4 e8 d c4. b8
    a4 d c4. c8
    c4 c2 d8[ e]
    f[ e d c] h[ a] g[ f]
    e4 c' c h
    c2 r
  }
}

SopranoLyricsA = \lyricmode {
  Pu -- er __ _
  na -- tus in Beth -- le --
  hem, in Beth -- le --
  hem, un -- de
  gau -- _ _
  det Je -- ru -- sa --
  lem.
}

SopranoLyricsB = \lyricmode {
  Hic ja -- _
  cet in prae -- se -- pi --
  o, prae -- se -- pi --
  o, qui, qui
  re -- _ gnat
  si -- ne ter -- mi --
  no.
}

SopranoLyricsC = \lyricmode {
  Glo -- ri -- a
  ti -- bi __ _ Do -- mi --
  ne, Do -- _ mi --
  ne qui, qui
  na -- _ tus
  es de Vir -- gi --
  ne.
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    f2 g
    f2. e4
    f f2 e4
    f a g2
    f4. e8 d4 d
    c c d4. d8
    e2 r
  }
}

AltoLyricsA = \lyricmode {
  Pu -- er
  na -- tus
  in Beth -- le --
  hem, un -- de
  gau -- _ det, gau --
  det Je -- ru -- sa --
  lem.
}

AltoLyricsB = \lyricmode {
  Hic ja --
  cet in
  prae -- se -- pi --
  o, qui re --
  gnat, __ _ re -- gnat
  si -- ne ter -- mi --
  no.
}

AltoLyricsC = \lyricmode {
  Glo -- ri --
  a ti --
  bi Do -- mi --
  ne qui na --
  tus, __ _ na -- tus
  es de Vir -- gi --
  ne.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    a4 f c'2
    c4 b g4. g8
    f4 g g4. g8
    a2 c4. c8
    a4 d4. c8 h[ a]
    g4 e a g
    g2 r
  }
}

TenoreLyricsA = \lyricmode {
  Pu -- er na --
  tus in Beth -- le --
  hem, in Beth -- le --
  hem, un -- de
  gau -- _ _ _
  det Je -- ru -- sa --
  lem.
}

TenoreLyricsB = \lyricmode {
  Hic ja -- cet
  in prae -- se -- pi --
  o, prae -- se -- pi --
  o, qui __ _
  re -- _ _ gnat
  si -- ne ter -- mi --
  no.
}

TenoreLyricsC = \lyricmode {
  Glo -- ri --
  a ti -- bi Do -- mi --
  ne, Do -- _ mi --
  ne qui __ _
  na -- _ _ tus
  es de Vir -- gi --
  ne.
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
    f4 a e d8 c
    a4 b c4. c8
    d4 b c4. c8
    f,4 r e' c
    d f g g,
    c a' f g
    c,2 r
  }
}

BassoLyricsA = \lyricmode {
  Pu -- er na -- tus in
  Beth -- _ _ le --
  hem, in Beth -- le --
  hem, un -- de
  gau -- _ det, gau --
  det Je -- ru -- sa --
  lem.
}

BassoLyricsB = \lyricmode {
  Hic ja -- cet in prae --
  se -- _ _ pi --
  o, prae -- se -- pi --
  o, qui re --
  gnat, __ _ re -- gnat
  si -- ne ter -- mi --
  no.
}

BassoLyricsC = \lyricmode {
  Glo -- ri -- a ti -- bi
  Do -- _ _ mi --
  ne, Do -- _ mi --
  ne qui na --
  tus, __ _ na -- tus
  es de Vir -- gi --
  ne.
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Presto"
    f4 a e d8 c
    a4 b c2
    d4 b c c,
    f f' e c
    d f g g,
    c a' f g
    c, c' f, g
  }
}

BassFigures = \figuremode {
  r1
  r2 <4>4 <3>
  r2 <4>4 <3>
  r1
  r2 <_!>
  r <6 5>4 <_!>
  r2 <6 5>4 <_!>
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
    \new ChoirStaff \with { \setGroupDistance #16 #16 } <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyricsA
      \new Lyrics \lyricsto Soprano \SopranoLyricsB
      \new Lyrics \lyricsto Soprano \SopranoLyricsC

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyricsA
      \new Lyrics \lyricsto Alto \AltoLyricsB
      \new Lyrics \lyricsto Alto \AltoLyricsC

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyricsA
      \new Lyrics \lyricsto Tenore \TenoreLyricsB
      \new Lyrics \lyricsto Tenore \TenoreLyricsC

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyricsA
      \new Lyrics \lyricsto Basso \BassoLyricsB
      \new Lyrics \lyricsto Basso \BassoLyricsC
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
