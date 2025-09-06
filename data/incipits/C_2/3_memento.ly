\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Adagio[se]"
    r4 f d d
    r f e2~
    e4 d2 cis4
    f4. g8 c,4 c
    r8 f4 f8 f d f4~
    f g8 f e4 f~
    f e f2
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "Adagio[se]"
    r2 a
    d4 d,8 f g4 a
    a2 r4 e'~
    e d8 e f2
    f,4 r r8 b d4~
    d8 b d4 c2
    c r4 c
  }
}

ViolinoI = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "Adagio[se]"
    r4 a' f f
    b2. a8 g
    f2 e
    r r4 c'~
    c b8 c d2
    d4 b2 a4
    g2 a4 a~
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Adagio[se]"
    r4 f d d
    r f e2~
    e4 d2 cis4
    f4. g8 c,4 c
    r8 f4 f8 f d f4~
    f g8 f e4 f~
    f e f2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio[se]"
    r4 a' f f
    b2. a8 g
    f2 e
    r r4 c'~
    c b8 c d2~
    d4 b2 a4
    g2 a4 a~
  }
}

SopranoLyrics = \lyricmode {
  Me -- men -- to
  me -- i, me --
  men -- to,
  me --
  i me -- men --
  to mi
  De -- us, ach __
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio[se]"
    r4 f d d
    r f e2~
    e4 d2 cis4
    f4. g8 c,4 c
    r8 f4 f8 f d f4~
    f g8 f e4 f~
    f e f2
  }
}

AltoLyrics = \lyricmode {
  Me -- men -- to,
  me -- men --
  _ to
  me -- i, De -- us,
  me -- i, De -- us, me --
  i me -- men -- _
  _ to,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio[se]"
    r2 a
    d4 d,8 f g4 a
    a2 r4 e'~
    e d8 e f2
    f,4 r r8 b d4~
    d8 b d4 c2
    c r4 c
  }
}

TenoreLyrics = \lyricmode {
  Me --
  men -- to, me -- men -- _
  to me --
  i me -- men --
  to, me -- men --
  to, me -- men --
  to, ach
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio[se]"
    r2 r4 f^\tutti
    d d cis cis
    d2 a
    r r4 a'~
    a g8 a b2
    b, c4 f
    c2 f,
  }
}

BassoLyrics = \lyricmode {
  Me --
  men -- to me -- i,
  De -- us,
  me --
  i me -- men --
  to, me -- i,
  De -- us,
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Adagio[se]"
    d1~-\tutti
    d2 cis
    d a
    d4. c!8 a4 a'~
    a g8 a b2
    b, c4 f
    c2 f,~
  }
}

BassFigures = \figuremode {
  r1
  <6->2 <7>4 <6>8 <5>
  <9>4 <8> <4> <_+>
  <9> <8>8 <5 3> <6>4 <10>
  r q8 q q2
  <5>4 <6>8 <5> <7>2
  <4>4 <3>2.
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
