\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    r4 d' b8 g e' cis
    a r r4 r2
    r4 c!8 a d8. c16 h8 e~
    e d c8. c16 d c d8 es d
    d4 r r2
    r f8. f16 e!8 f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    a'4 f8 d4 e a8
    f r r4 r2
    r4 r8 f4 d8 g16 f g8~
    g e4 a b8 a8. a16
    g4 r r2
    r d'8. d16 e!8 f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*3
    r2 r4 a'8^\solo a
    b c16[ d] es8.\trill es16 d4 r
    R1
  }
}

SopranoLyrics = \lyricmode {
  Et in
  u -- num Do -- mi -- num
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    a'4^\solo f8 d b' g a4
    f8 g a b c16[ b] c8 r a
    g4 f r2
    R1
    r2 r8 f[ es] d
    d16[ c] c8 r4 r2
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe -- li et
  ter -- rae,

  Je -- sum
  Chri -- stum,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*4
    r2 r8 d[^\solo c] b
    b16[ a] a8 r4 r2
  }
}

TenoreLyrics = \lyricmode {
  Je -- sum
  Chri -- stum,
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r2 r4 r8 f~^\solo
    f e f8. e16 d8 g4 f8
    e a4 g8 fis g g \hA fis
    g4 r r2
    f!8 f16 f g8 a b4. a8
  }
}

BassoLyrics = \lyricmode {
  vi --
  si -- bi -- li -- um o -- mni --
  um et in -- vi -- si -- bi -- li --
  um.
  Fi -- li -- um De -- i u -- "ni -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    d8-\solo d'4 b8 g e cis a
    d16 d' c! b a8 g f a e f
    c8. b16 a8 f b4 g
    c a d8 b c d
    << { g16 f es d } \\ { g,4 } >> c8 f b, b' es, b
    f' f, g a b b'4 a8
  }
}

BassFigures = \figuremode {
  r1
  r
  <5 4>8 <\t 3> <6>4 <5>8 <6> <5 _!> <6 \t>
  <5> <6>4. <_+>8 r <6 5 _-> <_+>
  r4 <_->8 <7>4. r4
  <6 4>8 <5 3>2 <5 3>8 <6 4!> <8 6>
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
