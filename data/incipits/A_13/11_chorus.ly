\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Largo"
    f'4.-\tutti f8 f f g g
    fis2 r4 r8 c
    e e c a' f4 r8 d~
    d d b' b a4. a8
    a2 a4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Largo"
    a'4.-\tutti a8 b b b b
    a4~ a8 d b b g g
    e e r c' a a f f
    d d r d' cis cis d d
    d4 cis d r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    a'4.^\tutti a8 b4 b8 b
    a8. a16 a8 d b b g g
    e e r c' a a f f
    d d r d' cis cis d d
    d4 cis d8 a a a
  }
}

SopranoLyrics = \lyricmode {
  Ey laßt uns dan de --
  mü -- thig -- lich zu Got -- tes Füſ -- ſen
  fal -- len, zu Got -- tes Füſ -- ſen
  fal -- len, zu Got -- tes Füſ -- ſen
  fal -- _ len und ihm "an -"
}

TenoreI = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    d4.^\tutti d8 d4 d8 d
    d8. d16 d4 r8 g, c4~
    c8 c c a f f r f
    b4. b8 a4 a
    a2 a8 fis' fis fis
  }
}

TenoreILyrics = \lyricmode {
  Ey laßt uns dan de --
  mü -- thig -- lich zu Got --
  tes Füſ -- ſen fal -- len, zu
  Got -- tes Füſ -- ſen
  fal -- len und ihm "an -"
}

TenoreII = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    f,4.^\tutti f8 f4 g8 g
    fis8. fis16 fis4 r r8 g
    g e e c r4 r8 f
    f f g g e4 f
    e2 d8 d' d d
  }
}

TenoreIILyrics = \lyricmode {
  Ey laßt uns dan de --
  mü -- thig -- lich zu
  Got -- tes Füſ -- ſen, zu
  Got -- tes, Got -- tes Füſ -- ſen
  fal -- len und ihm "an -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    d4.^\tutti d8 b4 g8 g'
    d8. d16 d4 r8 g e e
    c c a a r f' d d
    b b g g r a' f d
    a2 d4 r
  }
}

BassoLyrics = \lyricmode {
  Ey laßt uns dan de --
  mü -- thig -- lich zu Got -- tes
  Füſ -- ſen fal -- len, zu Got -- tes
  Füſ -- ſen fal -- len, zu Füſ -- ſen
  fal -- len
}

Continuo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Largo"
    d4.-\tutti d8 b4 g8 g'
    d2 r8 g e! e
    c c a a r f' d d
    b b g g a a' f d
    a'4 a, d8 \clef tenor d'[ d d]
  }
}

BassFigures = \figuremode {
  r2 <5>
  <_+>1
  r
  r2 <_+>4 <6>
  <4> <_+>4. q
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
        \new Voice = "TenoreI" { \dynamicUp \TenoreI }
      }
      \new Lyrics \lyricsto TenoreI \TenoreILyrics

      \new Staff {
        \set Staff.instrumentName = "T 2"
        \new Voice = "TenoreII" { \dynamicUp \TenoreII }
      }
      \new Lyrics \lyricsto TenoreII \TenoreIILyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  % \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
