\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/4 \tempoMarkup "Allegro"
    R1*3
    r4 g''8. g16 a8 c, c h!
    c g' f e16 d g e f g a f g a
    d,8 g f d c g a4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/4 \tempoMarkup "Allegro"
    R1*3
    r4 b'8 c c a g16 a f g
    e c d e f d e f e8 c' a c
    b g16 c a8 f' f8. e16 f4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    a'4^\solo d,8 d' c a b4
    a8 d d c f4. e8
    f a, a[ g]\trill a4 r
    R1*2
    r2 c8. c16 a8 f
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe -- _
  li et ter -- rae,

  et ex Pa -- tre
}

Alto = {
  \relative c' {
    \clef alto
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1*2
    r2 r8 e4^\solo f8
    f f f8. e16 f4 r
    R1
    r2 r4 f8. f16
  }
}

AltoLyrics = \lyricmode {
  et in --
  vi -- si -- bi -- li -- um,

  et ex
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1*2
    c8^\solo c d e16 d cis8 cis16 cis c8 a
    d c b8. b16 a4 r
    R1*2
  }
}

TenoreLyrics = \lyricmode {
  vi -- si -- bi -- li -- um o -- mni -- um et in --
  vi -- si -- bi -- li -- um,
}

Basso = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r4 d^\solo a8 a' g e
    f4 e8 a a f c'4
    a8 f b,4 a r
    b'8 a g c, f f16 f e8 d
    c c d d16 d e[ c d e] f[ d e f]
    g8 e f b, c8. c16 f,4
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem coe --
  li et ter -- rae,
  et in u -- num Do -- mi -- num Je -- sum
  Chri -- stum, Fi -- li -- um De -- _
  _ i u -- ni -- ge -- ni -- tum,
}

Organo = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/4 \tempoMarkup "Allegro"
    d8-\solo e f d a a' g e
    f4 e8 a a f c'4
    a8 f b,4 a8 a16 g a8 f
    b a g c f, f' e d
    c4 d e f
    g8 e f b, c4 f,
  }
}

BassFigures = \figuremode {
  r2. <_->8 <5>
  q <6> <7> <_!> <6>4 <4>8 <3>
  <6>4 <7>8 <6> <_+>4 <_!>
  r8 r <7> <7>4. <6>8 <6!>
  r1
  <_->2 <4>8 <3>4.
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
        \set Staff.instrumentName =  \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName =  \markup \center-column { "T" "trb 2" }
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
